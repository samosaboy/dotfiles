-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0) == "" then
--       vim.cmd("Neotree reveal toggle")
--     end
--   end,
-- })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keybinding to toggle Neo-tree
vim.keymap.set("n", "<C-n>", ":Neotree reveal toggle<CR>", { noremap = true, silent = true })
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<C-CR>", "i<CR><Esc>", { noremap = true, silent = true })

-- Map Tab and Shift-Tab to navigate buffers
vim.api.nvim_set_keymap("n", "<TAB>", ":bn!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bp!<CR>", { noremap = true, silent = true })
