vim.g.mapleader = ','
require("plugins-installer")
vim.cmd([[set tabstop=2]])
vim.cmd([[set shiftwidth=2]])
vim.cmd([[set expandtab]])
vim.cmd([[set smartindent]])
vim.cmd([[set relativenumber]])
vim.cmd([[set clipboard+=unnamedplus]])
vim.filetype.add({ extension = { templ = "templ" } })
