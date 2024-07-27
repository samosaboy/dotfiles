return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = false,
        dim_inactive = true,
        on_colors = function(colors)
          colors.bg = "#0D1017"
          colors.bg_dark = "#0D1017"
          colors.bg_float = "#131621"
          colors.bg_popup = "#131621"
          colors.bg_search = "#131621"
          colors.bg_sidebar = "#131621"
          colors.bg_statusline = "#131621"
        end,
      })
    end,
  },
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("cyberdream").setup({
  --       transparent = false,
  --       italic_comments = false,
  --       hide_fillchars = true,
  --       borderless_telescope = false,
  --       terminal_colors = true,
  --       theme = {
  --         highlights = {
  --           LineNr = { fg = "#6a6a6a" },
  --           CursorLineNr = { fg = "#d6d6d6" },
  --         },
  --       },
  --     })
  --     vim.cmd("colorscheme cyberdream") -- set the colorscheme
  --   end,
  -- },
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
