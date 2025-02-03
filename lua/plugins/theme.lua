return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    overrides = function(colors)
      local theme = colors.theme
      -- return {
      --   TelescopeTitle = { fg = theme.ui.special, bold = true },
      --   TelescopePromptNormal = { bg = theme.ui.bg_p1 },
      --   TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
      --   TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
      --   TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
      --   TelescopePreviewNormal = { bg = theme.ui.bg_dim },
      --   TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
      --   NormalFloat = { bg = "none" },
      --   FloatBorder = { bg = "none" },
      --   FloatTitle = { bg = "none" },
      --   -- Save an hlgroup with dark background and dimmed foreground
      --   -- so that you can use it where your still want darker windows.
      --   -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
      --   NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
      --
      --   -- Popular plugins that open floats will link to NormalFloat by default;
      --   -- set their background accordingly if you wish to keep them dark and borderless
      --   LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      --   MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      -- }
    end,
    config = function()
      require("kanagawa").setup({
        transparent = false,
        globalStatus = false,
        dimInactive = false,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })
      vim.cmd("colorscheme kanagawa-wave")
    end,
  },
  -- {
  --   "tiagovla/tokyodark.nvim",
  --   opts = {
  --     -- custom options here
  --   },
  --   config = function(_, opts)
  --     require("tokyodark").setup(opts) -- calling setup is optional
  --     vim.cmd([[colorscheme tokyodark]])
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       transparent = false,
  --       dim_inactive = true,
  --       on_colors = function(colors)
  --         colors.bg = "#0D1017"
  --         colors.bg_dark = "#0D1017"
  --         colors.bg_float = "#131621"
  --         colors.bg_popup = "#131621"
  --         colors.bg_search = "#131621"
  --         colors.bg_sidebar = "#131621"
  --         colors.bg_statusline = "#131621"
  --       end,
  --     })
  --   end,
  -- },
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
