return {
  {
    "pantharshit00/vim-prisma",
  },
  {
    "ibhagwan/fzf-lua",
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end,
    opts = {
      oldfiles = {
        -- In Telescope, when I used <leader>fr, it would load old buffers.
        -- fzf lua does the same, but by default buffers visited in the current
        -- session are not included. I use <leader>fr all the time to switch
        -- back to buffers I was just in. If you missed this from Telescope,
        -- give it a try.
        include_current_session = true,
      },
      previewers = {
        builtin = {
          -- fzf-lua is very fast, but it really struggled to preview a couple files
          -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
          -- It turns out it was Treesitter having trouble parsing the files.
          -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
          -- (Yes, I know you shouldn't have 100KB minified files in source control.)
          syntax_limit_b = 1024 * 100, -- 100KB
        },
      },
      grep = {
        -- One thing I missed from Telescope was the ability to live_grep and the
        -- run a filter on the filenames.
        -- Ex: Find all occurrences of "enable" but only in the "plugins" directory.
        -- With this change, I can sort of get the same behaviour in live_grep.
        -- ex: > enable --*/plugins/*
        -- I still find this a bit cumbersome. There's probably a better way of doing this.
        rg_glob = true, -- enable glob parsing
        glob_flag = "--iglob", -- case insensitive globs
        glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
      },
    },
  },
  -- {
  --   "telescope.nvim",
  --   dependencies = {
  --     {
  --       "nvim-telescope/telescope-fzf-native.nvim",
  --       build = "make",
  --     },
  --     "nvim-telescope/telescope-file-browser.nvim",
  --   },
  --   keys = {
  --     {
  --       "<leader>fP",
  --       function()
  --         require("telescope.builtin").find_files({
  --           cwd = require("lazy.core.config").options.root,
  --         })
  --       end,
  --       desc = "Find Plugin File",
  --     },
  --     {
  --       ";f",
  --       function()
  --         local builtin = require("telescope.builtin")
  --         builtin.find_files({
  --           no_ignore = false,
  --           hidden = true,
  --         })
  --       end,
  --       desc = "Lists files in your current working directory, respects .gitignore",
  --     },
  --     {
  --       ";r",
  --       function()
  --         local builtin = require("telescope.builtin")
  --         builtin.live_grep({
  --           -- additional_args = { "--hidden" },
  --         })
  --       end,
  --       desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
  --     },
  --     {
  --       "\\\\",
  --       function()
  --         local builtin = require("telescope.builtin")
  --         builtin.buffers()
  --       end,
  --       desc = "Lists open buffers",
  --     },
  --     {
  --       ";t",
  --       function()
  --         local builtin = require("telescope.builtin")
  --         builtin.help_tags()
  --       end,
  --       desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
  --     },
  --     {
  --       ";;",
  --       function()
  --         local builtin = require("telescope.builtin")
  --         builtin.resume()
  --       end,
  --       desc = "Resume the previous telescope picker",
  --     },
  --     {
  --       ";e",
  --       function()
  --         local builtin = require("telescope.builtin")
  --         builtin.diagnostics()
  --       end,
  --       desc = "Lists Diagnostics for all open buffers or a specific buffer",
  --     },
  --     {
  --       ";s",
  --       function()
  --         local builtin = require("telescope.builtin")
  --         builtin.treesitter()
  --       end,
  --       desc = "Lists Function names, variables, from Treesitter",
  --     },
  --     {
  --       "sf",
  --       function()
  --         local telescope = require("telescope")
  --
  --         local function telescope_buffer_dir()
  --           return vim.fn.expand("%:p:h")
  --         end
  --
  --         telescope.extensions.file_browser.file_browser({
  --           path = "%:p:h",
  --           cwd = telescope_buffer_dir(),
  --           respect_gitignore = false,
  --           hidden = true,
  --           grouped = true,
  --           previewer = false,
  --           initial_mode = "normal",
  --           layout_config = { height = 40 },
  --         })
  --       end,
  --       desc = "Open File Browser with the path of the current buffer",
  --     },
  --   },
  --   config = function(_, opts)
  --     local telescope = require("telescope")
  --     local actions = require("telescope.actions")
  --     local fb_actions = require("telescope").extensions.file_browser.actions
  --
  --     -- opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
  --     --   wrap_results = true,
  --     --   layout_strategy = "horizontal",
  --     --   layout_config = { prompt_position = "top" },
  --     --   sorting_strategy = "ascending",
  --     --   winblend = 0,
  --     --   mappings = {
  --     --     n = {},
  --     --   },
  --     -- })
  --     -- opts.pickers = {
  --     --   diagnostics = {
  --     --     theme = "ivy",
  --     --     initial_mode = "normal",
  --     --     layout_config = {
  --     --       preview_cutoff = 9999,
  --     --     },
  --     --   },
  --     -- }
  --     telescope.setup(opts)
  --     require("telescope").load_extension("fzf")
  --     require("telescope").load_extension("file_browser")
  --   end,
  -- },
}
