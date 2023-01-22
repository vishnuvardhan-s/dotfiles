return require('packer').startup(function(use)

    use {
        'wbthomason/packer.nvim'
    }

    use {
        'nvim-tree/nvim-web-devicons',
    }

    use {
        'neoclide/coc.nvim', 
        branch = 'release',
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require 'Comment'.setup()
        end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require 'nvim-tree'. setup {
                view = {
                    adaptive_size = true
                }
            }
        end
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require 'telescope'.setup {
                pickers = {
                    buffers = {
                        theme = 'dropdown',
                        previewer = false
                    },
                    find_files = {
                        theme = 'dropdown',
                        previewer= false
                    }
                }
            }
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        require 'lualine'.setup {
            options = {
                globalstatus = true,
            },
            tabline = {
                lualine_a = {
                    {
                        'buffers',
                        right_padding = 2,
                        symbols = { alternate_file = '' },
                    },
                },
            }
        }
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require 'gitsigns'.setup {
                current_line_blame = true, 
                current_line_blame_opts = {
                    virtual_text = true,
                    delay = 500,        
                },
                current_line_blame_formatter_opts = {
                    relative_time = true
                }
            }
        end
    }

    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup {
                open_mapping = [[<C-\>]],
                direction = "float",
                hide_numbers = true,
                shade_terminals = true,
                persist_mode = true,
                insert_mappings = true,
                terminal_mappings = true,
                persist_size = true,
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "curved",
                    winblend = 3,
                }
            }
        end
    }

    use {
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            require 'catppuccin'.setup {
                flavour = 'mocha',
                compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
                transparent_background = true,
                term_colors = false,
                dim_inactive = {
                    enabled = false,
                    shade = 'dark',
                    percentage = 0.15,
                },
                integrations = {
                    gitsigns = true,
                    nvimtree = true,
                    telescope = true,
                    treesitter = true,
                }
            }
            vim.api.nvim_command 'colorscheme catppuccin'
        end
    }

end)
