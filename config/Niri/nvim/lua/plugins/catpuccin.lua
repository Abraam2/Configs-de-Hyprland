-- Cargamos los colores de Matugen de forma segura arriba del todo
local matugen = pcall(require, "config.noctalia-custom") and require("config.noctalia-custom") or nil

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,

      custom_highlights = function(colors)
        local highlights = {
          -- Tus cambios para machacar la negrita en HTML
          ["@tag"] = { style = {} },
          ["@tag.builtin"] = { style = {} },
          ["@tag.attribute"] = { style = {} },
          ["@tag.delimiter"] = { style = {} },
          ["htmlTagName"] = { style = {} },
          ["htmlTag"] = { style = {} },
          ["htmlArg"] = { style = {} },
        }

        -- Si Matugen generó los colores, mapeamos todo el ecosistema
        if matugen then
          -- 1. Dashboard de Snacks y clásico
          if matugen.logo then
            highlights["SnacksDashboardHeader"] = { fg = matugen.logo, style = {} }
            highlights["SnacksDashboardIcon"] = { fg = matugen.logo, style = {} }
            highlights["SnacksDashboardKey"] = { fg = matugen.logo }
            highlights["DashboardHeader"] = { fg = matugen.logo }
            highlights["DashboardIcon"] = { fg = matugen.logo }
          end

          if matugen.botones then
            highlights["SnacksDashboardDesc"] = { fg = matugen.botones }
            highlights["SnacksDashboardSpecial"] = { fg = matugen.botones }
            highlights["DashboardDesc"] = { fg = matugen.botones }
            highlights["DashboardCenter"] = { fg = matugen.botones }
          end

          -- 2. Líneas divisorias
          if matugen.lineas then
            highlights["WinSeparator"] = { fg = matugen.lineas, bold = true }
            highlights["NeoTreeWinSeparator"] = { fg = matugen.lineas, bold = true }
          end

          -- 3. Iconos y nombres de carpetas en Neo-tree
          if matugen.carpetas then
            highlights["NeoTreeDirectoryIcon"] = { fg = matugen.carpetas }
            highlights["NeoTreeDirectoryName"] = { fg = matugen.carpetas }
            highlights["NeoTreeExpander"] = { fg = matugen.carpetas }
          end

          -- 4. Color del número de la línea actual adaptado al tema
          if matugen.linea_actual then
            highlights["CursorLineNr"] = { fg = matugen.linea_actual, bold = true }
          end

          -- 5. LA TRAMPA TOTAL: Rutas, pestañas, barras de ventana y cabeceras de Neo-tree
          if matugen.ruta_neotree then
            highlights["NeoTreeRootName"] = { fg = matugen.ruta_neotree, bold = true }
            highlights["StatusLine"] = { fg = matugen.ruta_neotree }
            highlights["StatusLineNC"] = { fg = matugen.ruta_neotree }
            highlights["WinBar"] = { fg = matugen.ruta_neotree }
            highlights["WinBarNC"] = { fg = matugen.ruta_neotree }

            -- Pestañas superiores
            highlights["NeoTreeTabActive"] = { fg = matugen.ruta_neotree, bold = true }
            highlights["NeoTreeTabInactive"] = { fg = matugen.ruta_neotree }
            highlights["NeoTreeTabSeparatorActive"] = { fg = matugen.ruta_neotree }
            highlights["NeoTreeTabSeparatorInactive"] = { fg = matugen.ruta_neotree }

            -- Barras de título y cabeceras de la ventana del árbol
            highlights["NeoTreeWinBar"] = { fg = matugen.ruta_neotree, bold = true }
            highlights["NeoTreeWinBarNC"] = { fg = matugen.ruta_neotree, bold = true }
            highlights["NeoTreeStatusLine"] = { fg = matugen.ruta_neotree }
            highlights["NeoTreeStatusLineNC"] = { fg = matugen.ruta_neotree }
          end

          -- 6. Cambiar la línea del borde de Which Key
          if matugen.borde_whichkey then
            highlights["WhichKeyBorder"] = { fg = matugen.borde_whichkey }
          end

          -- 8. Cambiar el color del prompt al hacer ":"
          if matugen.color_prompt then
            highlights["MsgArea"] = { fg = matugen.color_prompt }
            highlights["ModeMsg"] = { fg = matugen.color_prompt, bold = true }
            highlights["NoiceCmdline"] = { fg = matugen.color_prompt }
            highlights["NoiceCmdlinePopupBorder"] = { fg = matugen.color_prompt }
          end

          -- 9. Cambiar solo las notificaciones normales (INFO)
          if matugen.notif_info then
            highlights["SnacksNotifierInfo"] = { fg = matugen.notif_info }
            highlights["SnacksNotifierBorderInfo"] = { fg = matugen.notif_info }
            highlights["SnacksNotifierIconInfo"] = { fg = matugen.notif_info }
            highlights["SnacksNotifierTitleInfo"] = { fg = matugen.notif_info, bold = true }
            highlights["NotifyINFOBody"] = { fg = matugen.notif_info }
            highlights["NotifyINFOBorder"] = { fg = matugen.notif_info }
            highlights["NotifyINFOIcon"] = { fg = matugen.notif_info }
            highlights["NotifyINFOTitle"] = { fg = matugen.notif_info, bold = true }
          end

          -- 10. Grupos oficiales de ventanas flotantes y diálogos en Neo-tree
          if matugen.dialogos_neotree then
            highlights["NeoTreeFloatTitle"] = { bg = matugen.dialogos_neotree, fg = "#000000", bold = true }
            highlights["NeoTreeTitleBar"] = { bg = matugen.dialogos_neotree, fg = "#000000", bold = true }
            highlights["NeoTreeFloatBorder"] = { fg = matugen.dialogos_neotree }
            highlights["FloatTitle"] = { bg = matugen.dialogos_neotree, fg = "#000000", bold = true }
            highlights["FloatBorder"] = { fg = matugen.dialogos_neotree }
          end
        end

        return highlights
      end,

      integrations = {
        treesitter = true,
        native_lsp = { enabled = true },
        semantic_tokens = true,
        dashboard = false,
        neotree = true,
        which_key = true,
        snacks = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
