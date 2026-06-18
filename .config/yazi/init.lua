require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})

require("close-and-restore-tab"):setup()

-- No se como pollas hace que esto no quede curseado, yazi usa bordes redondos y esto cuadrados y queda demasiado curseado xD
-- require("relative-motions"):setup({ show_numbers = "relative" })

require("recycle-bin"):setup({
	-- Optional: Override automatic trash directory discovery
	-- trash_dir = "~/.local/share/Trash/",  -- Uncomment to use specific directory
})

require("projects"):setup({
	save = {
		method = "lua", -- Usamos 'lua' porque el método 'yazi' es un dolor de cabeza
	},
	last = {
		update_after_save = true,
		update_after_load = true,
		-- update_before_quit = true, -- <-- Guarda tus pestañas automáticamente al salir
		-- load_after_start = true, -- <-- Abre tu último proyecto automáticamente al iniciar
	},
	notify = {
		enable = true,
		title = "Proyectos Yazi",
		timeout = 3,
		level = "info",
	},
})

require("git"):setup({
	-- Order of status signs showing in the linemode
	order = 1500,
})
