return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
  opts = {
    auto_clean_after_session_restore = false,
    tabline = true,
    tabline_icons = true,
    auto_expand_width = true,
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
          ".idea",
          "dist",
          "build",
          ".DS_Store",
          "thumbs.db",
          "node_modules",
        },
        never_show = {},
      },
    },
    buffers = {
      follow_current_file = {
        -- leave_dirs_open = true,
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
