local map = vim.keymap.set

vim.opt.ignorecase = true

-- Keybinding to toggle Neo-tree
vim.keymap.set("n", "<C-n>", ":Neotree reveal toggle<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-n>", "snacks_explorer_start_directory", { noremap = true, silent = true })

vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<C-CR>", "i<CR><Esc>", { noremap = true, silent = true })
vim.g.copilot_assume_mapped = true

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

vim.keymap.set("n", "<c-P>", ":Telescope find_files<CR>", { noremap = true, silent = true, desc = "Find files" })
vim.keymap.set("n", ";r", ":Telescope live_grep<CR>", { noremap = true, silent = true, desc = "Live grep" })
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", { noremap = true, silent = true, desc = "List buffers" })

local opts = { noremap = true, silent = true }

-- Jump to previous / next cursor position (jumplist)
vim.keymap.set("n", "<D-[>", "<C-o>", { noremap = true, silent = true, desc = "Jump back in jumplist" })
vim.keymap.set("n", "<D-]>", "<C-i>", { noremap = true, silent = true, desc = "Jump forward in jumplist" })

-- View marks
vim.keymap.set("n", "<leader>m", ":marks<CR>", { noremap = true, silent = true, desc = "View marks" })

-- Show errors and warnings in a floating window
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
  end,
})

-- Code actions.lua
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
  require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

-- Copy path of cwd
vim.api.nvim_create_user_command("Cppath", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {}) 

-- Expand window by 20w with <C-w>+
vim.keymap.set("n", "<C-w>+", function()
  local current_width = vim.api.nvim_win_get_width(0)
  vim.api.nvim_win_set_width(0, current_width + 20)
end, { noremap = true, silent = true, desc = "Expand window width by 20" })
-- Collapse window by 20w with <C-w>-
vim.keymap.set("n", "<C-w>-", function()
  local current_width = vim.api.nvim_win_get_width(0)
  vim.api.nvim_win_set_width(0, math.max(current_width - 20, 1)) -- Ensure width doesn't go below 1
end, { noremap = true, silent = true, desc = "Collapse window width by 20" })

-- Delete without yanking
map({"n", "v"}, "x", '"_x')
map({"n", "v"}, "X", '"_X')

vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, opts)

