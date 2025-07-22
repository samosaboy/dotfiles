return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   ---@class PluginLspOpts
  --   opts = {
  --     servers = {
  --       pyright = {},
  --       cssls = {},
  --       html = {},
  --       ts_ls = {},
  --       jsonls = {},
  --       eslint = {},
  --     },
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",
    -- opts = function()
    --   local keys = require("lazyvim.plugins.lsp.keymaps").get()
    --   keys[#keys + 1] = { "gD", vim.lsp.buf.declaration }
    --   keys[#keys + 1] = { "gd", vim.lsp.buf.definition }
    --   keys[#keys + 1] = { "gi", vim.lsp.buf.implementation }
    --   keys[#keys + 1] = { "gl", '<cmd>lua vim.diagnostic.open_float({ scope = "line" })<CR>' }
    --   keys[#keys + 1] = { "<leader>sh", vim.lsp.buf.signature_help }
    --   keys[#keys + 1] = { "gr", false }
    -- end,
  },
--   {
--   "saghen/blink.cmp",
--   dependencies = { "rafamadriz/friendly-snippets", "nvim-lua/plenary.nvim" },
--   -- Use latest release tag pre-built binaries.
--   version = "v0.*",
--   -- `opts` is optional.
--   opts = {
--     keymap = {
--       -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate).
--       preset = "super-tab"
--     },
--     completion = {
--       documentation = {
--         -- Automatically show the documentation window when selecting a completion item.
--         auto_show = true,
--       },
--     }
--   }
-- },
}
