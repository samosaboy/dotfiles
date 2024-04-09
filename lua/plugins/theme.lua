return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000
 },
  -- {
  --   "ribru17/bamboo.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("bamboo").setup({
  --       -- optional configuration here
  --     })
  --     require("bamboo").load()
  --   end,
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --     dim_inactive = true,
  --     lualine_bold = false,
  --     hide_inactive_statusline = false,
  --   },
  -- },
}

-- Embark Theme
-- return {
--   {
--     "embark-theme/vim",
--   },
-- }
--
-- Synthweave
-- return {
--   {
--     "samharju/synthweave.nvim",
--     lazy = false, -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme("synthweave-transparent")
--     end,
--   },
-- }
