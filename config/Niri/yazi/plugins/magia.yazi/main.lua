local function file_exists(filename)
	local f = io.open(filename, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local function fail(s, ...)
	ya.notify({
		title = "Me pica el culo",
		content = string.format(s, ...),
		level = "error",
		timeout = 5,
	})
end

local function success(s, ...)
	ya.notify({
		title = "Me pica el culo",
		content = string.format(s, ...),
		level = "info",
		timeout = 5,
	})
end

-- Solo formatos de imagen. Nada de ofimática.
local ext_imagenes =
	{ png = true, jpg = true, jpeg = true, webp = true, bmp = true, gif = true, tiff = true, avif = true, dds = true }

local selected_or_hovered = ya.sync(function()
	local tab, paths = cx.active, {}
	for _, u in pairs(tab.selected) do
		paths[#paths + 1] = tostring(u)
	end
	if #paths == 0 and tab.current.hovered then
		paths[1] = tostring(tab.current.hovered.url)
	end
	return paths
end)

return {
	entry = function()
		ya.emit("escape", { visual = true })

		local urls = selected_or_hovered()
		if #urls == 0 then
			return fail("No hay archivos seleccionados")
		end

		local value, event = ya.input({
			title = "Extensión de imagen (ej: png, webp, jpg):",
			pos = { "top-center", y = 3, w = 45 },
		})

		if event ~= 1 or not value or value == "" then
			return
		end

		local ext = value:match("^%s*(.-)%s*$"):lower()
		if ext:sub(1, 1) == "." then
			ext = ext:sub(2)
		end

		-- Si pides algo que no sea imagen, te frena.
		if not ext_imagenes[ext] then
			return fail("La extensión .%s no es de imagen.", ext)
		end

		for _, source in pairs(urls) do
			local source_extension = source:match("^.+(%..+)$")

			if source_extension then
				local src_ext = source_extension:sub(2):lower()
				local destination = string.gsub(source, source_extension, "." .. ext)

				-- Si el origen no es una imagen, también te frena.
				if not ext_imagenes[src_ext] then
					fail("El archivo original es .%s. Esto solo siver para imágenes tetico.", src_ext)
					return
				end

				if src_ext == ext then
					fail("El archivo ya es un .%s", ext)
					return
				end

				if file_exists(destination) then
					fail("El archivo %s ya existe.", destination:match("[^/]+$"))
					return
				end

				-- Va directo a ImageMagick sin más preguntas
				local output, err = Command("magick"):arg(source):arg(destination):output()

				if not output or err then
					fail("Fallo al convertir: %s", tostring(err))
				else
					success("¡Hecho! .%s pasado a .%s", src_ext, ext)
				end
			end
		end
	end,
}
