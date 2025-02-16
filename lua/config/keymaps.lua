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
-- vim.keymap.set("n", "<C-n>", ":Neotree reveal toggle<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-n>", "snacks_explorer_start_directory", { noremap = true, silent = true })

vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<C-CR>", "i<CR><Esc>", { noremap = true, silent = true })

-- Map Tab and Shift-Tab to navigate buffers
vim.api.nvim_set_keymap("n", "<TAB>", ":bn!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bp!<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>y", ":1,$y+<CR>", { noremap = true, silent = true, desc = "Copy all lines to clipboard" })
vim.keymap.set(
  "n",
  "<Leader>r",
  [[:%s/\<<C-r><C-w>\>//g<Left><Left>]],
  { noremap = true, silent = true, desc = "Search and replace word under cursor" }
)

vim.keymap.set("n", "<c-P>", require("fzf-lua").files, { desc = "Fzf Files" })
vim.keymap.set("n", ";r", require("fzf-lua").live_grep, { desc = "Grep visual" })
vim.keymap.set("n", ";R", require("fzf-lua").grep_visual, { desc = "Grep visual" })
