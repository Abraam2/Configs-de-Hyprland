local function entry()
	-- 1. Lanzar el input nativo de Yazi
	local value, event = ya.input({
		title = "Extensión a mover (ej: jpg):",
		pos = { "center", w = 40 },
	})

	-- Si cancelas (event ~= 1), salimos
	if event ~= 1 then
		return
	end

	-- 2. Ejecutar el comando de mover usando el valor que escribiste
	-- Usamos shell y le pasamos el 'value' como argumento
	ya.emit("shell", {
		"find . -mindepth 2 -name '*." .. value .. "' -exec mv -n {} . \\;",
		block = true,
		confirm = true,
	})
end

return { entry = entry }
