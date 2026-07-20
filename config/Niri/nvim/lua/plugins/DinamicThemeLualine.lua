-- Cargamos los colores de Matugen de forma segura
local matugen = pcall(require, "config.noctalia-custom") and require("config.noctalia-custom") or nil

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      if not matugen or not matugen.lualine_normal_b then
        return
      end

      -- Esperamos a que Lualine cargue el tema actual para poder tunearlo
      local lualine_theme = opts.options and opts.options.theme or "auto"

      -- Si el tema está definido por un nombre (como 'catppuccin'), intentamos cargarlo
      if type(lualine_theme) == "string" then
        local success, theme_table = pcall(require, "lualine.themes." .. lualine_theme)
        if success then
          lualine_theme = theme_table
        else
          lualine_theme = "auto"
        end
      end

      -- Si logramos obtener la tabla del tema, inyectamos tus colores en el Modo Normal
      if type(lualine_theme) == "table" and lualine_theme.normal then
        -- Sección A (El bloque de NORMAL): Fondo acento, texto negro
        if lualine_theme.normal.a then
          lualine_theme.normal.a.bg = matugen.lualine_normal_b
          lualine_theme.normal.a.fg = "#000000"
        end

        -- Sección B (El bloque de la rama git): Fondo oscuro original, texto acento
        if lualine_theme.normal.b then
          lualine_theme.normal.b.fg = matugen.lualine_normal_b
        end

        -- Sección C y X/Y (Textos intermedios y porcentajes): Texto acento
        if lualine_theme.normal.c then
          lualine_theme.normal.c.fg = matugen.lualine_normal_b
        end

        -- Sección Z (El bloque del reloj): Fondo acento, texto negro
        if lualine_theme.normal.z then
          lualine_theme.normal.z.bg = matugen.lualine_normal_b
          lualine_theme.normal.z.fg = "#000000"
        end

        -- Aplicamos el tema modificado de vuelta a las opciones globales
        opts.options.theme = lualine_theme
      end

      -- Dejamos el reloj con su formato limpio y LE AÑADIMOS EL ICONO DE VUELTA
      if opts.sections and opts.sections.lualine_z then
        opts.sections.lualine_z = {
          {
            "datetime",
            style = "%H:%M",
            icon = "", -- Aquí tienes tu icono del reloj metido al inicio
          },
        }
      end

      -- Limpiamos las modificaciones manuales anteriores en los componentes de las secciones
      if opts.sections and opts.sections.lualine_a then
        opts.sections.lualine_a = { { "mode" } }
      end
      if opts.sections and opts.sections.lualine_b then
        opts.sections.lualine_b = { { "branch" }, { "diff" } }
      end
    end,
  },
}
