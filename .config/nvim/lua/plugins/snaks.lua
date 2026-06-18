return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      sources = {
        files = {
          follow = true, -- Para que también busque dentro de tus dotfiles enlazados

          -- Aquí le metemos la lista negra para que ignore los binarios
          exclude = {
            "*/bin/*",
            "*/.local/bin/*",
            "*/.config/BraveSoftware/*",
            "*/.cache/*",
            "*/.git/*",
            "*/node_modules/*",
            "*/target/*",
            "*/build/*",
            "*.png",
            "*.jpg",
            "*.jpeg",
            "*.gif",
            "*.ico",
            "*.webp",
            "*.mp4",
            "*.mkv",
            "*.avi",
            "*.webm",
            "*.pdf",
            "*.zip",
            "*.tar.gz",
            "*.rar",
            "*.7z",
            "*.exe",
            "*.dll",
            "*.so",
            "*.class",
            "*.jar",
            "*.bin",
            "*.o",
            "*.out",
          },
        },
      },

      -- Si habías puesto la función rara de "open_symlink_or_confirm" de antes,
      -- bórrala entera del bloque 'actions', ya no la vas a necesitar con 'follow = true'.
    },
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
                                                                                
                                                                                
                                                                                
                                                                                   
          ████ ██████           █████      ██                      
         ███████████             █████                              
        █████████ ███████████████████ ███   ███████████   
       █████████  ███    █████████████ █████ ██████████████   
      █████████ ██████████ █████████ █████ █████ ████ █████   
    ███████████ ███    ███ █████████ █████ █████ ████ █████  
   ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                                
                                                                                
                                                                                ]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = function()
              Snacks.picker.files({ cwd = vim.fn.expand("~/.config/nvim") })
            end,
          },
          {
            icon = " ",
            key = "s",
            desc = "Restore Session",
            action = ':lua require("persistence").load({ last = true })',
          },
          {
            icon = "󱂬 ",
            key = "S",
            desc = "Select Session Menu",
            action = ':lua require("persistence").select()',
          },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
