local M = {}

-- Helper para escapar comillas simples en rutas
local function esc(s)
	return s:gsub("'", "'\\''")
end

-- Comprueba si una ruta existe en el disco
local function path_exists(path)
	local cha, _ = fs.cha(Url(path))
	return cha ~= nil
end

-- Une rutas de forma segura
local function path_join(parent, name)
	return tostring(parent) .. "/" .. name
end

-- Extrae el nombre del archivo o carpeta
local function get_filename(path)
	return path:match("[^/]+$") or path
end

-- Obtiene el directorio actual y los archivos en el portapapeles de Yazi
local get_cwd_and_yanked = ya.sync(function()
	local paths = {}
	for _, u in pairs(cx.yanked) do
		paths[#paths + 1] = tostring(u)
	end
	return tostring(cx.active.current.cwd), paths, cx.yanked.is_cut
end)

-- Generador de nombres únicos para que jamás anide carpetas
local function get_unique_copy_path(cwd, filename)
	local base, ext = filename:match("^(.-)(%.%w+)$")
	if not base then
		base = filename
		ext = ""
	end
	local counter = 1
	local new_name = string.format("%s_copy%s", base, ext)
	local new_path = path_join(cwd, new_name)

	while path_exists(new_path) do
		counter = counter + 1
		new_name = string.format("%s_copy_%d%s", base, counter, ext)
		new_path = path_join(cwd, new_name)
	end
	return new_path
end

--==============================================================================
-- ENTRY POINT
--==============================================================================

function M:entry()
	local cwd, yanked_files, is_cut = get_cwd_and_yanked()

	-- 1. Si se ha cortado (cut) o no hay nada copiado, pegado nativo normal
	if is_cut or #yanked_files == 0 then
		ya.emit("paste", {})
		ya.emit("unyank", {})
		return
	end

	local has_collisions = false

	-- 2. Comprobamos si hay cualquier colisión
	for _, src_path in ipairs(yanked_files) do
		local filename = get_filename(src_path)
		local dest_path = path_join(cwd, filename)
		if path_exists(dest_path) then
			has_collisions = true
			break
		end
	end

	-- 3. Si no hay colisiones, pegado nativo rápido y nos vamos
	if not has_collisions then
		ya.emit("paste", {})
		ya.emit("unyank", {})
		return
	end

	local bulk_action = nil

	-- 4. Si hay colisión, SIEMPRE sacamos el menú
	for i, src_path in ipairs(yanked_files) do
		local filename = get_filename(src_path)
		local dest_path = path_join(cwd, filename)

		if path_exists(dest_path) then
			local action = nil

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

				if choice and choice > 2 then
					choice = choice - 2
				else
					choice = nil
				end

				if choice == 4 then
					bulk_action = "overwrite_all"
					action = 1
				elseif choice == 5 then
					bulk_action = "copy_all"
					action = 2
				elseif choice == 6 then
					bulk_action = "skip_all"
					break
				else
					action = choice
				end
			end

			if action == 1 then
				-- SOBREESCRIBIR: Solo borra y reemplaza si viene de otra carpeta
				if src_path ~= dest_path then
					local cmd_type = is_cut and "mv" or "cp -r"
					local cmd = string.format(
						"rm -rf '%s' && %s '%s' '%s'",
						esc(dest_path),
						cmd_type,
						esc(src_path),
						esc(dest_path)
					)
					os.execute(cmd)
				end
			elseif action == 2 then
				-- RENOMBRAR: Crea la copia en una ruta 100% nueva (jamás anidará)
				local copy_path = get_unique_copy_path(cwd, filename)
				local cmd_type = is_cut and "mv" or "cp -r"
				local cmd = string.format("%s '%s' '%s'", cmd_type, esc(src_path), esc(copy_path))
				os.execute(cmd)
			end
		else
			local cmd_type = is_cut and "mv" or "cp -r"
			os.execute(string.format("%s '%s' '%s'", cmd_type, esc(src_path), esc(dest_path)))
		end
	end

	ya.emit("unyank", {})
end

return M
