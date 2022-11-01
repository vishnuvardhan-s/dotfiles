vim.g.mapleader = " "
local keybind = vim.keymap.set

-- leader mappings
keybind('n', '<SPACE>', '<Nop>', {silent = true})
keybind('n', '<leader>q', ':q<CR>', {silent = true})
keybind('n', '<leader>w', ':wa<CR>', {silent = true})
keybind('n', '<leader>v', ':vs<cr><right>', {silent = true})
keybind('n', '<leader>h', ':sp<cr><down>', {silent = true})
keybind('n', '<leader>l', '15<C-w><', {silent = true})
keybind('n', '<leader>r', '15<C-w>>', {silent = true})
keybind('n', '<leader>d', '10<C-w>+', {silent = true})
keybind('n', '<leader>u', '10<C-w>-', {silent = true})
keybind('n', '<leader>n', ':NvimTreeFindFile<CR>', {silent = true})
keybind('n', '<leader>f', ':Telescope find_files<CR>', {silent = true})
keybind('n', '<leader>s', ':Telescope live_grep<CR>', {silent = true})
keybind('n', '<leader>o', ':Telescope buffers<CR>', {silent = true})
keybind('n', '<leader>c', ':Telescope grep_string<CR>', {silent = true})
keybind('n', '<leader>a', '<Plug>(coc-codeaction-selected)<CR>', {silent = true})
keybind('n', '<leader>ep', '<Plug>(coc-diagnostic-prev)', {silent = true})
keybind('n', '<leader>en', '<Plug>(coc-diagnostic-next)', {silent = true})
keybind('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', {silent = true})
keybind('n', '<leader>gd', ':Gitsigns diffthis<CR>', {silent = true})
keybind('n', '<leader>gc', ':Telescope git_commits<CR>', {silent = true})
keybind('n', '<leader>gb', ':Telescope git_branches<CR>', {silent = true})
keybind('n', '<leader>gs', ':Telescope git_status<CR>', {silent = true})
keybind('n', '<leader>bs', ':mksession! <C-R>=ConstructSessionFileName()<CR><CR>', {silent = true})
keybind('n', '<leader>bo', ':source <C-R>=ConstructSessionFileName()<CR><CR>', {silent = true})
keybind('n', '<leader>br', ':!rm <C-R>=ConstructSessionFileName()<CR>', {silent = true})

-- arrow mappings
keybind('n', '<up>', '<C-w><up>', {silent = true})
keybind('n', '<down>', '<C-w><down>', {silent = true})
keybind('n', '<left>', '<C-w><left>', {silent = true})
keybind('n', '<right>', '<C-w><right>', {silent = true})

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

-- capital letter mappings
keybind('n', 'K', '<CMD>lua _G.show_docs()<CR>', {silent = true})
keybind('n', 'E', 'v$h', {silent = true})

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- insert mode mappings
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keybind('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keybind('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keybind('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- goto mappings
keybind('n', 'gd', '<Plug>(coc-definition)', {silent = true})
keybind('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
keybind('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
keybind('n', 'gr', '<Plug>(coc-references)', {silent = true})

-- other mappings
keybind('n', '<CR>', ':noh<CR><CR>', {silent = true})
