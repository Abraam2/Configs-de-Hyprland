local M = {}

-- Pon true si quieres ver notificaciones de depuración
local DEBUG = false

local function dbg(msg)
	if DEBUG then
		ya.notify({ title = "paste-menu", content = msg, timeout = 5 })
	end
end

-- Escapa comillas simples para shell (devuelve SOLO el string)
local function esc(s)
	local r = s:gsub("'", "'\\''")
	return r
end

-- Comprueba si una ruta existe (archivo, carpeta o symlink roto)
local function path_exists(path)
	local ok, cha = pcall(function()
		local c = fs.cha(Url(path))
		return c
	end)
	if ok and cha ~= nil then
		return true
	end
	local f = io.open(path, "r")
	if f then
		f:close()
		return true
	end
	return false
end

local function path_join(parent, name)
	return tostring(parent) .. "/" .. name
end

local function get_filename(path)
	return path:match("[^/]+$") or path
end

-- Convierte lo que devuelva cx.yanked (File, Url o string) en ruta string
local function to_path(u)
	if type(u) == "string" then
		return u
	end
	local ok, url = pcall(function()
		return u.url
	end)
	if ok and url ~= nil then
		return tostring(url)
	end
	return tostring(u)
end

-- Directorio actual + archivos yankeados + si es cut
local get_cwd_and_yanked = ya.sync(function()
	local paths = {}
	for _, u in pairs(cx.yanked) do
		local ok, url = pcall(function()
			return u.url
		end)
		if ok and url ~= nil then
			paths[#paths + 1] = tostring(url)
		else
			paths[#paths + 1] = tostring(u)
		end
	end
	return tostring(cx.active.current.cwd), paths, cx.yanked.is_cut
end)

-- Nombre único para la copia
local function get_unique_copy_path(cwd, filename)
	local base, ext = filename:match("^(.-)(%.%w+)$")
	if not base or base == "" then
		base = filename
		ext = ""
	end
	local counter = 1
	local new_path = path_join(cwd, string.format("%s_copy%s", base, ext))
	while path_exists(new_path) do
		counter = counter + 1
		new_path = path_join(cwd, string.format("%s_copy_%d%s", base, counter, ext))
	end
	return new_path
end

local function run(cmd)
	os.execute(cmd)
end

local function copy(src, dst)
	run(string.format("cp -r '%s' '%s'", esc(src), esc(dst)))
end

function M:entry()
	local cwd, yanked_files, is_cut = get_cwd_and_yanked()

	dbg(
		string.format("cwd=%s | n=%d | cut=%s | first=%s", cwd, #yanked_files, tostring(is_cut), yanked_files[1] or "-")
	)

	-- 1. Cut o nada copiado: pegado nativo
	if is_cut or #yanked_files == 0 then
		ya.emit("paste", {})
		ya.emit("unyank", {})
		return
	end

	-- 2. ¿Hay colisiones?
	local has_collisions = false
	for _, src_path in ipairs(yanked_files) do
		local dest_path = path_join(cwd, get_filename(src_path))
		local exists = path_exists(dest_path)
		dbg("dest=" .. dest_path .. " exists=" .. tostring(exists))
		if exists then
			has_collisions = true
			break
		end
	end

	-- 3. Sin colisiones: pegado nativo
	if not has_collisions then
		ya.emit("paste", {})
		ya.emit("unyank", {})
		return
	end

	-- 4. Con colisiones: menú
	local bulk_action = nil

	for i, src_path in ipairs(yanked_files) do
		local filename = get_filename(src_path)
		local dest_path = path_join(cwd, filename)

		if path_exists(dest_path) then
			local action = nil -- 1 = sobreescribir, 2 = renombrar, 3 = omitir

			if bulk_action == "skip_all" then
				break
			elseif bulk_action == "overwrite_all" then
				action = 1
			elseif bulk_action == "copy_all" then
				action = 2
			else
				local choice = ya.which({
					cands = {
						{ desc = string.format("%s (%d/%d)", filename, i, #yanked_files), on = "|" },
						{ desc = "", on = "|" },
						{ desc = "Sobreescribir", on = "o" },
						{ desc = "Renombrar con _copy", on = "c" },
						{ desc = "Omitir este archivo", on = "q" },
						{ desc = "Sobreescribir TODOS", on = "O" },
						{ desc = "Renombrar TODOS", on = "C" },
						{ desc = "Cancelar operación", on = "Q" },
					},
				})

				-- Esc o líneas cabecera: cancelar
				if not choice or choice <= 2 then
					break
				end

				choice = choice - 2 -- 1=o, 2=c, 3=q, 4=O, 5=C, 6=Q

				if choice == 1 then
					action = 1
				elseif choice == 2 then
					action = 2
				elseif choice == 3 then
					action = 3
				elseif choice == 4 then
					bulk_action = "overwrite_all"
					action = 1
				elseif choice == 5 then
					bulk_action = "copy_all"
					action = 2
				else -- 6 = cancelar todo
					break
				end
			end

			if action == 1 then
				-- Si origen y destino son el mismo archivo, no hacer nada (evita borrarlo)
				if src_path ~= dest_path then
					run(string.format("rm -rf '%s' && cp -r '%s' '%s'", esc(dest_path), esc(src_path), esc(dest_path)))
				end
			elseif action == 2 then
				copy(src_path, get_unique_copy_path(cwd, filename))
			end
			-- action == 3: omitir
		else
			copy(src_path, dest_path)
		end
	end

	ya.emit("unyank", {})
end

return M
