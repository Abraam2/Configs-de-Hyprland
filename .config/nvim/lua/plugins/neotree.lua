return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["d"] = "trash",
          ["D"] = "delete",
        },
      },

      filesystem = {
        follow_current_file = { enabled = true, leave_dirs_open = false },
        follow_symlinks = true,
        use_libuv_file_watcher = true,

        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
      },
    },
  },
}
