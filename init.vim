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
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

" lua code
lua << EOF
require("lualine").setup {
    options = {
        globalstatus = true,
    },
	tabline = {
		lualine_a = {
			{
				"buffers",
				right_padding = 2,
				symbols = { alternate_file = "" },
			},
		},
	},
}

vim.cmd [[autocmd VimResized * lua require'nvim-tree.view'.View.width=NvimTreeWidth()]]

function NvimTreeWidth()
    local winwidth = vim.fn.winwidth(0)
    if winwidth <= 100 then
        return 30
    elseif winwidth <= 200 then
        return 40
    else
        return 50
    end
end

require("nvim-tree").setup {
    view = {
        width = NvimTreeWidth(),
    }
}

require('gitsigns').setup {
    current_line_blame = true, 
    current_line_blame_opts = {
        delay = 500,        
    },
    current_line_blame_formatter_opts = {
        relative_time = true
    }
}

require('telescope').setup {
  pickers = {
    buffers = {
        theme = "dropdown",
        previewer = false
    },
    find_files = {
        theme = "dropdown",
        previewer= false
    }
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
set nowrap                                           " dont wrap lines
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
set scrolloff=10                                     " make it so there are always ten lines below my cursor
syntax on                                            " syntax highlighting              
filetype plugin indent on                            " allows auto-indenting depending on file type
colorscheme onehalfdark                              " color scheme

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
nnoremap <leader>o :Telescope buffers<CR>
nnoremap <leader>c :Telescope grep_string<CR>
nnoremap <leader>a  <Plug>(coc-codeaction-selected)<CR>
nnoremap <leader>ep <Plug>(coc-diagnostic-prev)
nnoremap <leader>en <Plug>(coc-diagnostic-next)
nnoremap <leader>gh :Gitsigns preview_hunk<CR>
nnoremap <leader>gd :Gitsigns diffthis<CR>
nnoremap <leader>gc :Telescope git_commits<CR>
nnoremap <leader>gb :Telescope git_branches<CR>
nnoremap <leader>gs :Telescope git_status<CR>

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

" capital letter mappings 
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <silent> Y v$h

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

" functions
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" customizations
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=150}
