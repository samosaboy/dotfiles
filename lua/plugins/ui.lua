return {
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4,
        },
      },
    },
  },

  -- codesnap
  {
    "mistricky/codesnap.nvim",
    build = "make",
    lazy = true,
    cmd = { "CodeSnap", "CodeSnapSave" },
    config = function()
      require("codesnap").setup({
        has_breadcrumbs = true,
        bg_theme = "summer",
        watermark = "",
        bg_color = "#535c68",
        has_line_number = true,
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        git_branches = {
          initial_mode = "normal",
          previewer = false,
        },
        git_status = {
          initial_mode = "normal",
          path_display = { "tail" },
        },
        git_stash = {
          initial_mode = "normal",
        },
        git_commits = {
          initial_mode = "normal",
        },
        lsp_references = {
          initial_mode = "normal",
          path_display = { "tail" },
        },
        oldfiles = {
          initial_mode = "normal",
        },
      },
      defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = { prompt_position = "top" },
        },
      },
    },
    keys = {
      { "<leader>/", false },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      default_component_configs = {
        indent = {
          with_markers = false,
        },
      },
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_by_name = {
            "node_modules",
          },
        },
      },
      source_selector = {
        winbar = true,
      },
      window = {
        mappings = {
          ["<Tab>"] = "next_source",
          ["<S-Tab>"] = "prev_source",
        },
      },
    },
  },
}
