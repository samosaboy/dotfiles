return {
  {
    "fynnfluegge/monet.nvim",
    name = "monet",
  },
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("cyberdream").setup({
  --       transparent = true, -- Default: false
  --       italic_comments = true, -- Default: false
  --       hide_fillchars = true, -- Default: false
  --       borderless_telescope = true, -- Default: true
  --       terminal_colors = true, -- Default: true
  --       -- theme = { -- Default: nil
  --       --   highlights = {
  --       --     Comment = { fg = "#696969", bg = "NONE", italic = true },
  --       --   },
  --       --
  --       --   -- Override a color entirely
  --       --   colors = {
  --       --     -- For a list of colors see `lua/cyberdream/colours.lua`
  --       --     -- Example:
  --       --     bg = "#000000",
  --       --     green = "#00ff00",
  --       --     magenta = "#ff00ff",
  --       --   },
  --       -- },
  --     })
  --     vim.cmd("colorscheme cyberdream") -- set the colorscheme
  --   end,
  -- },
  -- -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  --
  -- -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monet",
    },
  },
}
