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

-- Detectamos si estamos dentro de Neovim buscando la variable de entorno $NVIM
local dentro_de_nvim = os.getenv("NVIM") ~= nil

require("projects"):setup({
	save = {
		method = "lua",
	},
	last = {
		update_after_save = true,
		update_after_load = true,
		-- Si estamos en Neovim, ponemos false para que NO guarde ni pise nada.
		-- Si estamos en Kitty normal, ponemos true para que mantenga tu sesión.
		update_before_quit = not dentro_de_nvim,

		-- Comentar para que yazi no recuerde la sesión automáticamente en kitty
		load_after_start = not dentro_de_nvim,
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
