-- create undo stack directory, if not exists
local undodir = os.getenv("userprofile") .. '/AppData/Local/nvim/tmp/.vim-undo-dir'
if vim.fn.isdirectory('.vim-undo-dir') ~= 0 then
    vim.cmd('call mkdir(undodir, "", 0700)')
end

-- vim options
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.scrolloff = 10
vim.o.ignorecase = true
vim.o.autoindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.undofile = true
vim.o.updatetime=300
vim.o.wrap = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.undodir = undodir
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true

