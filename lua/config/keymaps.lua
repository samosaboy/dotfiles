-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<C-CR>", "i<CR><Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-H>", "copilot#Previous()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-K>", "copilot#Next()", { silent = true, expr = true })

-- Map Tab and Shift-Tab to navigate buffers
vim.api.nvim_set_keymap("n", "<TAB>", ":bn!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bp!<CR>", { noremap = true, silent = true })

-- Map Option (Alt) + Tab and Shift-Option (Alt) + Tab to navigate tab pages
-- vim.api.nvim_set_keymap("n", "<M-TAB>", ":tabnext<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<M-S-TAB>", ":tabprev<CR>", { noremap = true, silent = true })
