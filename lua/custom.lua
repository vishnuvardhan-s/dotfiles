vim.cmd("autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=150}")
vim.cmd("highlight gitsignscurrentlineblame guibg=#fff guifg=#a9a9a9")
