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
    -- Bypass para Aceptar TODO (g1) usando gA
    vim.keymap.set("n", "gA", function()
      vim.api.nvim_feedkeys("g1", "m", false)
    end, { desc = "Aceptar TODAS las sugerencias IA en este buffer" })

    -- Bypass para Aceptar cambio actual (g2) usando ga
    vim.keymap.set("n", "ga", function()
      vim.api.nvim_feedkeys("g2", "m", false)
    end, { desc = "Aceptar sugerencia IA" })

    -- Bypass para Rechazar cambio actual (g3) usando gr
    vim.keymap.set("n", "gR", function()
      vim.api.nvim_feedkeys("g3", "m", false)
    end, { desc = "Rechazar sugerencia IA" })
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
  opts = {

    -- --- 3.1. Interfaz Visual ---
    display = {
      chat = {
        window = {
          width = 0.35,
        },
      },
    },

    -- --- 3.2. Estrategias por defecto ---
    -- strategies = {
    --   chat = { adapter = "ollama" },
    --   inline = { adapter = "ollama" },
    -- },

    strategies = {
      chat = { adapter = { name = "gemini", model = "gemini-3.5-flash" } },
      inline = { adapter = { name = "gemini", model = "gemini-3.5-flash" } },
    },

    -- --- 3.3. Configuración de Modelos (LLMs) ---
    adapters = {
      -- ollama = function()
      --   return require("codecompanion.adapters").extend("ollama", {
      --     env = { url = "http://127.0.0.1:11434" },
      --     schema = { model = { default = "qwen2.5-coder:14b" } },
      --   })
      -- end,
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = { api_key = "GEMINI_API_KEY" },
          opts = {
            system_prompt = "Eres un asistente de programación. Responde SIEMPRE en español.",
          },
        })
      end,
    },

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
}
