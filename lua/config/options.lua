-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.relativenumber = false
vim.opt.laststatus = 3

-- vim.opt.guifont = { "Hack", ":h16" }
-- vim.opt.guicursor = "n-v-c-sm:hor25,i-ci-ve:ver25,r-cr-o:block"
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.title = true
vim.opt.number = true

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
