return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       vtsls = {
  --         enabled = false,
  --       },
  --       tsserver = {
  --         enabled = true,
  --         settings = {
  --           typescript = {
  --             -- inlayHints = {
  --             --   includeInlayEnumMemberValueHints = true,
  --             --   includeInlayFunctionLikeReturnTypeHints = true,
  --             --   includeInlayFunctionParameterTypeHints = true,
  --             --   includeInlayParameterNameHints = "literals",
  --             --   includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --             --   includeInlayPropertyDeclarationTypeHints = true,
  --             --   includeInlayVariableTypeHints = false,
  --             --   includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  --             -- },
  --           },
  --           completions = {
  --             completeFunctionCalls = true,
  --           },
  --         },
  --         keys = {
  --           {
  --             "<leader>co",
  --             function()
  --               vim.lsp.buf.code_action({
  --                 apply = true,
  --                 context = {
  --                   only = { "source.organizeImports.ts" },
  --                   diagnostics = {},
  --                 },
  --               })
  --             end,
  --             desc = "Organize Imports",
  --           },
  --           {
  --             "<leader>cR",
  --             function()
  --               vim.lsp.buf.code_action({
  --                 apply = true,
  --                 context = {
  --                   only = { "source.removeUnused.ts" },
  --                   diagnostics = {},
  --                 },
  --               })
  --             end,
  --             desc = "Remove Unused Imports",
  --           },
  --         },
  --       },
  --     },
  --     setup = {
  --       tsserver = function()
  --         return false
  --       end,
  --       vtsls = function()
  --         return true
  --       end,
  --     },
  --   },
  -- },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- },
  -- messages, cmdline and the popupmenu
  -- {
  --   "folke/noice.nvim",
  --   opts = function(_, opts)
  --     table.insert(opts.routes, {
  --       filter = {
  --         event = "notify",
  --         find = "No information available",
  --       },
  --       opts = { skip = true },
  --     })
  --     local focused = true
  --     vim.api.nvim_create_autocmd("FocusGained", {
  --       callback = function()
  --         focused = true
  --       end,
  --     })
  --     vim.api.nvim_create_autocmd("FocusLost", {
  --       callback = function()
  --         focused = false
  --       end,
  --     })
  --     table.insert(opts.routes, 1, {
  --       filter = {
  --         cond = function()
  --           return not focused
  --         end,
  --       },
  --       view = "notify_send",
  --       opts = { stop = false },
  --     })
  --
  --     opts.commands = {
  --       all = {
  --         -- options for the message history that you get with `:Noice`
  --         view = "split",
  --         opts = { enter = true, format = "details" },
  --         filter = {},
  --       },
  --     }
  --
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = "markdown",
  --       callback = function(event)
  --         vim.schedule(function()
  --           require("noice.text.markdown").keys(event.buf)
  --         end)
  --       end,
  --     })
  --
  --     -- Disable autoformat for py files
  --     vim.api.nvim_create_autocmd({ "FileType" }, {
  --       pattern = { "py" },
  --       callback = function()
  --         vim.b.autoformat = false
  --       end,
  --     })
  --
  --     opts.presets.lsp_doc_border = true
  --   end,
  -- },

  -- {
  --   "rcarriga/nvim-notify",
  --   opts = {
  --     timeout = 5000,
  --   },
  -- },
  -- filename
  -- {
  --   "b0o/incline.nvim",
  --   -- dependencies = { "craftzdog/solarized-osaka.nvim" },
  --   event = "BufReadPre",
  --   priority = 1200,
  --   config = function()
  --     local colors = require("bamboo.palette")
  --     require("incline").setup({
  --       highlight = {
  --         groups = {
  --           InclineNormal = { guibg = colors.dark3, guifg = colors.bg_dark },
  --           InclineNormalNC = { guifg = colors.dark3, guibg = colors.bg_dark },
  --         },
  --       },
  --       window = { margin = { vertical = 0, horizontal = 1 } },
  --       hide = {
  --         cursorline = true,
  --       },
  --       render = function(props)
  --         -- Get the buffer's name and modify it to a path relative to the cwd
  --         local relativePath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":.")
  --         local filename = vim.fn.fnamemodify(relativePath, ":t")
  --         -- Extract the directory path, excluding the filename, and ensure it's relative
  --         local dirpath = vim.fn.fnamemodify(relativePath, ":h")
  --         if dirpath == "." then
  --           -- If the file is in the cwd, don't prefix with "./"
  --           dirpath = ""
  --         else
  --           -- For files in subdirectories, add a trailing slash for visual separation
  --           dirpath = dirpath .. "/"
  --         end
  --
  --         if vim.bo[props.buf].modified then
  --           filename = "[+] " .. filename
  --         end
  --
  --         local icon, icon_color = require("nvim-web-devicons").get_icon_color(filename)
  --         return {
  --           { dirpath, guifg = colors.blue1 }, -- Dimmed path
  --           { icon .. " ", guifg = icon_color }, -- Icon with color
  --           { filename, guifg = colors.blue5 }, -- Highlighted filename
  --         }
  --       end,
  --     })
  --   end,
  -- },
  -- buffer line
  -- {
  --   "akinsho/bufferline.nvim",
  --   event = "VeryLazy",
  --   keys = {
  --     { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
  --     { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  --   },
  --   opts = {
  --     options = {
  --       -- mode = "tabs",
  --       -- separator_style = "slant",
  --       show_buffer_close_icons = true,
  --       show_close_icon = false,
  --       color_icons = true,
  --     },
  --   },
  -- },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   init = function()
  --     vim.g.lualine_laststatus = vim.o.laststatus
  --     if vim.fn.argc(-1) > 0 then
  --       -- set an empty statusline till lualine loads
  --       vim.o.statusline = " "
  --     else
  --       -- hide the statusline on the starter page
  --       vim.o.laststatus = 0
  --     end
  --   end,
  --   opts = function()
  --     -- PERF: we don't need this lualine require madness 🤷
  --     local lualine_require = require("lualine_require")
  --     lualine_require.require = require
  --
  --     local icons = require("lazyvim.config").icons
  --
  --     vim.o.laststatus = vim.g.lualine_laststatus
  --
  --     return {
  --       options = {
  --         theme = "auto",
  --         globalstatus = true,
  --         disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
  --       },
  --       sections = {
  --         lualine_a = { "mode" },
  --         lualine_b = { "branch" },
  --
  --         lualine_c = {
  --           LazyVim.lualine.root_dir(),
  --           {
  --             "diagnostics",
  --             symbols = {
  --               error = icons.diagnostics.Error,
  --               warn = icons.diagnostics.Warn,
  --               info = icons.diagnostics.Info,
  --               hint = icons.diagnostics.Hint,
  --             },
  --           },
  --           { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
  --           { LazyVim.lualine.pretty_path() },
  --         },
  --         lualine_x = {
  --         -- stylua: ignore
  --         {
  --           function() return require("noice").api.status.command.get() end,
  --           cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
  --           color = LazyVim.ui.fg("Statement"),
  --         },
  --         -- stylua: ignore
  --         {
  --           function() return require("noice").api.status.mode.get() end,
  --           cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
  --           color = LazyVim.ui.fg("Constant"),
  --         },
  --         -- stylua: ignore
  --         {
  --           function() return "  " .. require("dap").status() end,
  --           cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
  --           color = LazyVim.ui.fg("Debug"),
  --         },
  --           {
  --             require("lazy.status").updates,
  --             cond = require("lazy.status").has_updates,
  --             color = LazyVim.ui.fg("Special"),
  --           },
  --           {
  --             "diff",
  --             symbols = {
  --               added = icons.git.added,
  --               modified = icons.git.modified,
  --               removed = icons.git.removed,
  --             },
  --             source = function()
  --               local gitsigns = vim.b.gitsigns_status_dict
  --               if gitsigns then
  --                 return {
  --                   added = gitsigns.added,
  --                   modified = gitsigns.changed,
  --                   removed = gitsigns.removed,
  --                 }
  --               end
  --             end,
  --           },
  --         },
  --         -- lualine_y = {
  --         --   { "progress", separator = " ", padding = { left = 1, right = 0 } },
  --         --   { "location", padding = { left = 0, right = 1 } },
  --         -- },
  --         lualine_z = {
  --           function()
  --             return " " .. os.date("%R")
  --           end,
  --         },
  --       },
  --       -- extensions = { "neo-tree", "lazy" },
  --     }
  --   end,
  -- },

  -- -- colorful win separators
  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   config = true,
  --   event = { "WinNew" },
  -- },

  -- {
  --   "utilyre/barbecue.nvim",
  --   name = "barbecue",
  --   version = "*",
  --   theme = "catppuccin",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   opts = {
  --     show_dirname = false,
  --     show_basename = false,
  --   },
  -- },
  --
  -- {
  --   "aznhe21/actions-preview.nvim",
  --   config = function()
  --     vim.keymap.set({ "v", "n" }, "<Leader>ca", require("actions-preview").code_actions)
  --   end,
  -- },

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = true, auto_trigger = false, keymap = { accept = "<C-j>" } },
      panel = {
        enabled = true,
        auto_refresh = false,
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

  -- {
  --   "utilyre/barbecue.nvim",
  --   name = "barbecue",
  --   version = "*",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons", -- optional dependency
  --   },
  --   opts = {
  --     -- configurations go here
  --   },
  --   config = function()
  --     require("barbecue").setup({
  --       create_autocmd = false, -- prevent barbecue from updating itself automatically
  --     })
  --
  --     vim.api.nvim_create_autocmd({
  --       "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  --       "BufWinEnter",
  --       "CursorHold",
  --       "InsertLeave",
  --
  --       -- include this if you have set `show_modified` to `true`
  --       -- "BufModifiedSet",
  --     }, {
  --       group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  --       callback = function()
  --         require("barbecue.ui").update()
  --       end,
  --     })
  --   end,
  -- },
}
