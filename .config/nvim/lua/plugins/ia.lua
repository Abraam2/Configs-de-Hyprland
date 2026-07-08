return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  -- =========================================================
  -- 1. INICIALIZACIÓN Y ATAJOS FANTASMA (BYPASS)
  -- =========================================================
  init = function()
    -- Cargar el notificador externo
    require("plugins.codecompanion.codecompanion-notifier"):init()

    -- Formatear automáticamente cuando la IA termina de escribir en el buffer (Inline)
    local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})
    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "CodeCompanionInlineFinished",
      group = group,
      callback = function(request)
        vim.lsp.buf.format({ bufnr = request.buf })
      end,
    })

    -- Tus bypass de teclas
    vim.keymap.set("n", "gA", function()
      vim.api.nvim_feedkeys("g1", "m", false)
    end, { desc = "Aceptar TODAS" })
    vim.keymap.set("n", "ga", function()
      vim.api.nvim_feedkeys("g2", "m", false)
    end, { desc = "Aceptar actual" })
    vim.keymap.set("n", "gR", function()
      vim.api.nvim_feedkeys("g3", "m", false)
    end, { desc = "Rechazar actual" })
  end,
  -- =========================================================
  -- 2. ATAJOS DE TECLADO (MAPEOS GLOBALES)
  -- =========================================================
  keys = {
    { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle AI Assistance" },
    { "<leader>an", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "Open New AI Chat" },
    { "<leader>aA", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "Ask IA (cmd)" },
    { "<leader>am", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Actions Menu" },
    {
      "<leader>e",
      function()
        -- 1. Le pedimos el prompt al usuario mediante un cuadro flotante limpio
        vim.ui.input({ prompt = "Orden para la IA (Selección): " }, function(input)
          -- Si el usuario cancela con Esc o lo deja vacío, no hacemos nada
          if not input or input == "" then
            return
          end

          -- 2. Ejecutamos el comando clásico usando la API de Neovim pasándole las marcas visuales
          vim.cmd(":'<,'>CodeCompanion " .. input)
        end)
      end,
      mode = "v", -- Obligatorio: se ejecuta en modo visual con el texto seleccionado
      desc = "Editar selección con Prompt personalizado",
    },
  },

  -- =========================================================
  -- 3. CONFIGURACIÓN DEL PLUGIN (OPCIONES)
  -- =========================================================
  --
  opts = {
    language = "Spanish", -- No me pilla el lenguaje porque no le sale de la punta del pene y lo tengo que editar del archivo de conf en:
    -- /home/abraham/.local/share/nvim/lazy/codecompanion.nvim/lua/codecompanion/config.lua 'G

    -- --- 3.1. Interfaz Visual ---
    display = {
      chat = {
        window = {
          width = 0.45,
        },
      },
    },

    rules = {
      gibraltar = {
        description = "Gibraltar español",
        files = {
          "~/.config/nvim/apuntes/rules/gibraltar.md",
          -- Tengo en el contexto: IMPORTANTE: Responde obligatoriamente en español.
          -- Pero le suda los huevos, si se lo pongo yo va, pero si carga /rules no :)
        },
      },

      --
      --   -- Activamos el autoload para que se cargue solo
      --   opts = {
      --     chat = {
      --       autoload = { "default", "gibraltar" }, -- Carga tus reglas + las default
      --     },
      --   },
      --
    },

    --- 3.2. Estrategias por defecto ---

    strategies = {
      chat = { adapter = { name = "ollama", model = "qwen2.5-coder:14b" } },
      inline = { adapter = { name = "ollama", model = "qwen2.5-coder:14b" } },
    },

    -- strategies = {
    --   chat = { adapter = { name = "gemini", model = "gemini-3.5-flash" } },
    --   inline = { adapter = { name = "gemini", model = "gemini-3.5-flash" } },
    -- },

    -- --- 3.3. Configuración de Modelos (LLMs) ---
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          env = { url = "http://127.0.0.1:11434" },
          schema = { model = { default = "qwen2.5-coder:14b" } },
        })
      end,
      --
      -- gemini = function()
      --   return require("codecompanion.adapters").extend("gemini", {
      --     env = { api_key = "GEMINI_API_KEY" },
      --   })
      -- end,
      --  },

      -- --- 3.4. Interacciones Avanzadas (Manejo de Memoria) ---
      interactions = {
        chat = {
          opts = {
            context_management = {
              editing = {
                trigger = 0.65, -- Cuando el chat ocupe el 65% de la memoria, oculta resultados viejos
                keep_cycles = 3, -- Deja intactas las últimas 3 preguntas y respuestas
              },
              compaction = {
                trigger = 0.85, -- Si llega al 85%, la IA resume el chat entero en segundo plano
              },
            },
          },
        },
      },
    },
  },
}
