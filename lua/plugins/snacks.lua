return {
  "folke/snacks.nvim",
  opts = {
    debug = {
      enabled = false,
    },
    picker = {
      sources = {
        explorer = {
          layout = { layout = { position = "left" } },
          win = {
            list = {
              keys = {
                ["<ESC>"] = "",
                ["w"] = "confirm",
                ["l"] = "",
                ["h"] = "",
                ["C"] = "explorer_close",
              },
            },
          },
          ignored = false,
          hidden = true,
        },
      },
      icons = {
        git = {
          staged = "●",
          added = "A",
          deleted = "D",
          ignored = "",
          modified = "M",
          renamed = "R",
          untracked = "U",
        },
      },
    },
    indent = {
      indent = { enabled = false, char = "▏" },
      scope = {
        enabled = true,
        char = "▏",
        underline = false,
        only_current = true,
        hl = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterCyan",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
        },
      },
    },
    -- picker = {
    --   enabled = true,
    --   formatters = {
    --     file = {
    --       filename_first = false,
    --       filename_only = false,
    --       icon_width = 2,
    --     },
    --   },
    --   layout = {
    --     -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
    --     -- override picker layout in keymaps function as a param below
    --     preset = "telescope", -- defaults to this layout unless overidden
    --     cycle = false,
    --   },
    --   layouts = {
    --     select = {
    --       preview = false,
    --       layout = {
    --         backdrop = false,
    --         width = 0.6,
    --         min_width = 80,
    --         height = 0.4,
    --         min_height = 10,
    --         box = "vertical",
    --         border = "rounded",
    --         title = "{title}",
    --         title_pos = "center",
    --         { win = "input", height = 1, border = "bottom" },
    --         { win = "list", border = "none" },
    --         { win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
    --       },
    --     },
    --     telescope = {
    --       reverse = false, -- set to false for search bar to be on top
    --       layout = {
    --         box = "horizontal",
    --         backdrop = false,
    --         width = 0.8,
    --         height = 0.9,
    --         border = "none",
    --         {
    --           box = "vertical",
    --           { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
    --           { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
    --         },
    --         {
    --           win = "preview",
    --           title = "{preview:Preview}",
    --           width = 0.50,
    --           border = "rounded",
    --           title_pos = "center",
    --         },
    --       },
    --     },
    --     ivy = {
    --       layout = {
    --         box = "vertical",
    --         backdrop = false,
    --         width = 0,
    --         height = 0.4,
    --         position = "bottom",
    --         border = "top",
    --         title = " {title} {live} {flags}",
    --         title_pos = "left",
    --         { win = "input", height = 1, border = "bottom" },
    --         {
    --           box = "horizontal",
    --           { win = "list", border = "none" },
    --           { win = "preview", title = "{preview}", width = 0.5, border = "left" },
    --         },
    --       },
    --     },
    --   },
    -- },
    zen = {
      win = {
        backdrop = {
          transparent = true,
        },
      },
      toggles = {
        dim = false,
      },
    },
    explorer = {
      enabled = true,
      layout = {
        cycle = false,
      },
    },
    gitbrowse = {},
    image = {},
    zoom = {},
  },
  keys = {
    {
      "<C-n>",
      function()
        Snacks.picker.explorer()
      end,
      desc = "Explorer Snacks",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader><space>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    -- find
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    -- git
    {
      "<leader>gc",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    -- Grep
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    -- search
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>sa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Location List",
    },
    {
      "<leader>sM",
      function()
        Snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sR",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>uC",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },
    {
      "<leader>qp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },
    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<D-S-f>",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Zoom",
    },
  },
}
