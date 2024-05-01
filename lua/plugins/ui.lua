return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      -- Disable autoformat for py files
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "py" },
        callback = function()
          vim.b.autoformat = false
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

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
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        -- mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = false,
      },
    },
  },
  --
  -- -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    -- opts = function()
    --   local colors = require("monet.palette").default
    --   local copilot_colors = {
    --     [""] = { fg = colors.grey, bg = colors.none },
    --     ["Normal"] = { fg = colors.grey, bg = colors.none },
    --     ["Warning"] = { fg = colors.red, bg = colors.none },
    --     ["InProgress"] = { fg = colors.yellow, bg = colors.none },
    --   }
    --   return {
    --     options = {
    --       component_separators = { left = " ", right = " " },
    --       section_separators = { left = " ", right = " " },
    --       theme = "monet",
    --       globalstatus = true,
    --       disabled_filetypes = { statusline = { "dashboard", "alpha" } },
    --     },
    --     sections = {
    --       lualine_a = { { "mode", icon = "" } },
    --       lualine_b = { { "branch", icon = "" } },
    --       lualine_c = {
    --         {
    --           "diagnostics",
    --           symbols = {
    --             error = " ",
    --             warn = " ",
    --             info = " ",
    --             hint = "󰝶 ",
    --           },
    --         },
    --         { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
    --         {
    --           "filename",
    --           symbols = { modified = "  ", readonly = "", unnamed = "" },
    --         },
    --         {
    --           function()
    --             return require("nvim-navic").get_location()
    --           end,
    --           cond = function()
    --             return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
    --           end,
    --           color = { fg = colors.grey, bg = colors.none },
    --         },
    --       },
    --       lualine_x = {
    --         {
    --           require("lazy.status").updates,
    --           cond = require("lazy.status").has_updates,
    --           color = { fg = colors.green },
    --         },
    --         {
    --           function()
    --             local icon = " "
    --             local status = require("copilot.api").status.data
    --             return icon .. (status.message or "")
    --           end,
    --           cond = function()
    --             local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
    --             return ok and #clients > 0
    --           end,
    --           color = function()
    --             if not package.loaded["copilot"] then
    --               return
    --             end
    --             local status = require("copilot.api").status.data
    --             return copilot_colors[status.status] or copilot_colors[""]
    --           end,
    --         },
    --         { "diff" },
    --       },
    --       lualine_y = {
    --         {
    --           "progress",
    --         },
    --         {
    --           "location",
    --           color = { fg = colors.cyan, bg = colors.none },
    --         },
    --       },
    --       lualine_z = {
    --         function()
    --           return "  " .. os.date("%X") .. " 🚀 "
    --         end,
    --       },
    --     },
    --
    --     extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
    --   }
    -- end,
  },

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
  {
    "aznhe21/actions-preview.nvim",
    config = function()
      vim.keymap.set({ "v", "n" }, "<Leader>ca", require("actions-preview").code_actions)
    end,
  },

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = true, auto_trigger = true, keymap = { accept = "<C-j>" } },
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
}
