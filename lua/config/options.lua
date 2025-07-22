local o = vim.o
local a = vim.api

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.laststatus = 1

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

vim.opt.cmdheight = 1

o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.inccommand = "split"


for _, plugin in pairs({
    "netrwFileHandlers",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}) do
    vim.g["loaded_" .. plugin] = 1
end

