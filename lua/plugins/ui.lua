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

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
  -- filename
  {
    "b0o/incline.nvim",
    -- dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.dark3, guifg = colors.bg_dark },
            InclineNormalNC = { guifg = colors.dark3, guibg = colors.bg_dark },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          -- Get the buffer's name and modify it to a path relative to the cwd
          local relativePath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":.")
          local filename = vim.fn.fnamemodify(relativePath, ":t")
          -- Extract the directory path, excluding the filename, and ensure it's relative
          local dirpath = vim.fn.fnamemodify(relativePath, ":h")
          if dirpath == "." then
            -- If the file is in the cwd, don't prefix with "./"
            dirpath = ""
          else
            -- For files in subdirectories, add a trailing slash for visual separation
            dirpath = dirpath .. "/"
          end

          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, icon_color = require("nvim-web-devicons").get_icon_color(filename)
          return {
            { dirpath, guifg = colors.blue1 }, -- Dimmed path
            { icon .. " ", guifg = icon_color }, -- Icon with color
            { filename, guifg = colors.blue5 }, -- Highlighted filename
          }
        end,
      })
    end,
  },
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    -- opts = {
    --   options = {
    --     -- mode = "tabs",
    --     -- separator_style = "slant",
    --     show_buffer_close_icons = true,
    --     show_close_icon = true,
    --     color_icons = false,
    --   },
    -- },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- globalstatus = false,
        theme = "molokai",
      },
    },
  },

  -- colorful win separators
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },
}
