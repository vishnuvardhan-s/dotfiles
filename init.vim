" variables
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 15
let $plugindir = '~/.config/nvim/plugged'
let $undodir = '/tmp/.vim-undo-dir' 

if has("win32")
    let $plugindir = 'C:\Users\vishn\AppData\Local\nvim\plugged'
    let $undodir = 'C:\Users\vishn\AppData\Local\nvim\tmp\.vim-undo-dir'
endif

" plugins 
call plug#begin($plugindir)
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'tpope/vim-commentary'
Plug 'lewis6991/gitsigns.nvim' 
Plug 'kyazdani42/nvim-tree.lua',
Plug 'kyazdani42/nvim-web-devicons' 
call plug#end()

" lua code
lua << EOF
require('lualine').setup()
require("nvim-tree").setup()
require('gitsigns').setup {
    current_line_blame = true, 
    current_line_blame_opts = {
        delay = 500,        
    },
    current_line_blame_formatter_opts = {
        relative_time = true
    }
}
EOF

" settings
set nocompatible                                     " disable compatibility to old-time vi
set showmatch                                        " show matching brackets.
set ignorecase                                       " case insensitive matching
set hlsearch                                         " highlight search results
set autoindent                                       " indent a new line the same amount as the line just typed
set number                                           " add line numbers
set relativenumber                                   " add relative line numebrs
set wildmode=longest,list                            " get bash-like tab completions
set tabstop=4                                        " number of columns occupied by a tab character
set expandtab                                        " converts tabs to white space
set shiftwidth=4                                     " width for autoindents
set softtabstop=4                                    " see multiple spaces as tabstops so <BS> does the right thing
set mouse=a                                          " for scrolling with mouse
set clipboard=unnamedplus                            " use common clipboard
set undodir=$undodir                                 " set undo stack directory
set undofile                                         " save undo stack to the specified directory
set nobackup                                         " coc specific 
set nowritebackup                                    " coc specific 
set updatetime=300                                   " coc update time
set signcolumn=yes                                   " coc always show the single column
syntax on                                            " syntax highlighting              
filetype plugin indent on                            " allows auto-indenting depending on file type
colorscheme onehalfdark                              " color scheme
highlight CocFloating ctermbg=0|                     " match coc popup to onehalfdark background color

" leader mappings
let mapleader=" "
nnoremap <SPACE> <Nop>
nnoremap <leader>q :q<CR>   
nnoremap <leader>w :wa<CR>
nnoremap <leader>v :vs<cr><right>
nnoremap <leader>h :sp<cr><down>
nnoremap <leader>l 15<C-w><
nnoremap <leader>r 15<C-w>>
nnoremap <leader>d 10<C-w>+
nnoremap <leader>u 10<C-w>-
nnoremap <leader>n :NvimTreeFindFile<CR>
nnoremap <leader>f :Telescope find_files<CR>
nnoremap <leader>s :Telescope live_grep<CR>
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>c :Telescope grep_string<CR>
nnoremap <leader>a  <Plug>(coc-codeaction-selected)<CR>
nnoremap <leader>ep <Plug>(coc-diagnostic-prev)
nnoremap <leader>en <Plug>(coc-diagnostic-next)
nnoremap <leader>gh :Gitsigns preview_hunk<CR>
nnoremap <leader>gd :Gitsigns diffthis<CR>

" arrow mappings
nnoremap <up> <C-w><up>
nnoremap <down> <C-w><down>
nnoremap <left> <C-w><left>
nnoremap <right> <C-w><right>

" goto mappings
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gt <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" insert mode mappings
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1): CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" other mappings
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" create undo stack directory,  if not exists
if !isdirectory($undodir)
    call mkdir($undodir, "", 0700)
endif

" for onehalfdark colorscheme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
