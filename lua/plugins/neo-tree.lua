return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  opts = {
    tabline = true,
    tabline_icons = true,
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          ".git",
          ".idea",
          "dist",
          "build",
          ".DS_Store",
          "thumbs.db",
        },
        never_show = {},
      },
    },
    buffers = {
      follow_current_file = {
        leave_dirs_open = true,
      },
      window = {
        mappings = {
          -- disable Y mapping for warning: invalid mapping for Y nil
          -- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/1324
          ["Y"] = "noop",
        },
      },
    },
    git_status = {
      window = {
        mappings = {
          -- disable Y mapping for warning: invalid mapping for Y nil
          -- https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/1324
          ["Y"] = "noop",
        },
      },
    },
  },
}
