return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = false,
        italic_comments = false,
        hide_fillchars = true,
        borderless_telescope = false,
        terminal_colors = true,
        theme = {
          highlights = {
            LineNr = { fg = "#6a6a6a" },
            CursorLineNr = { fg = "#d6d6d6" },
          },
        },
      })
      vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
  },
  -- {
  --   "fynnfluegge/monet.nvim",
  --   name = "monet",
  --   config = function()
  --     require("monet").setup({
  --       transparent_background = true,
  --       semantic_tokens = true,
  --       dark_mode = true,
  --       highlight_overrides = {
  --         Normal = { fg = "#c2f5bf" },
  --         TelescopeMatching = { fg = "#5cd5db" },
  --       },
  --       color_overrides = {},
  --       styles = {},
  --     })
  --   end,
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "monet",
  --   },
  -- },
}
