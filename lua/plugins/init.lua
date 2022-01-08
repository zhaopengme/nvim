local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

local packer = Modx.utils.plugins.require('packer')

packer.init(Modx.plugins.packer.init)

local function is_enabled(plugin)
    return Modx.plugins[plugin].enabled
end

local function get_cmp()
    if Modx.plugins.cmp.enabled == true then
        return 'nvim-cmp'
    else
        return
    end
end

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Syntax Highlighting and Visual Plugins
    use {
        'norcalli/nvim-colorizer.lua',
        disable = not is_enabled('colorizer'),
        config = "require'plugins.config.colorizer'",
        event = 'BufRead'
    }
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = "require'plugins.config.bufferline'",
        disable = not is_enabled('bufferline'),
        event = 'BufWinEnter'
    }
    use {
        'nvim-lualine/lualine.nvim',
        disable = not is_enabled('lualine'),
        config = "require'plugins.config.lualine'",
        event = 'BufWinEnter'
    }
    use {
        'goolord/alpha-nvim',
        disable = not is_enabled('dashboard'),
        config = "require'plugins.config.dashboard'",
        event = 'BufWinEnter'
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        disable = not is_enabled('indent_blankline'),
        config = "require'plugins.config.blankline'",
        event = "BufRead"
    }
    use {
        "folke/zen-mode.nvim",
        config = "require'plugins.config.zen-mode'",
        disable = not is_enabled('zen_mode'),
        cmd = "ZenMode"
    }
    use {
        "folke/twilight.nvim",
        config = "require'plugins.config.twilight'",
        disable = not is_enabled('twilight'),
        cmd = "ZenMode"
    }

    -- Tree-Sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufWinEnter',
        run = ':TSUpdate',
        disable = not is_enabled('treesitter'),
        config = "require'plugins.config.treesitter'"
    }
    use {
        'p00f/nvim-ts-rainbow',
        disable = not is_enabled('treesitter'),
        after = 'nvim-treesitter'
    }
    use {
        'windwp/nvim-ts-autotag',
        disable = not is_enabled('treesitter'),
        after = 'nvim-treesitter'
    }

    -- Colorschemes
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        opt = true
    }
    use {
        'joshdick/onedark.vim',
        opt = true
    }
    use {
        'gruvbox-community/gruvbox',
        opt = true
    }
    use {
        'shaunsingh/nord.nvim',
        opt = true
    }
    use {
        'folke/tokyonight.nvim',
        opt = true
    }
    use {
        'dracula/vim',
        as = 'dracula',
        opt = true
    }
    use {
        'tiagovla/tokyodark.nvim',
        opt = true
    }

    -- LSP and Autocomplete
    use {
        'neovim/nvim-lspconfig',
        event = "BufRead"
    }
    use {'williamboman/nvim-lsp-installer'}
    use {'onsails/lspkind-nvim'}
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require 'plugins.config.cmp'
        end,
        disable = not is_enabled('cmp')
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
        disable = not is_enabled('cmp')
    }
    use {
        'hrsh7th/cmp-buffer',
        after = "nvim-cmp",
        disable = not is_enabled('cmp')
    }
    use {
        'uga-rosa/cmp-dictionary',
        disable = not is_enabled('cmp')
    }
    use {
        'hrsh7th/vim-vsnip',
        disable = not is_enabled('cmp'),
        after = "nvim-cmp"
    }
    use {
        'windwp/nvim-autopairs',
        after = get_cmp(),
        config = "require'plugins.config.autopairs'",
        disable = not is_enabled('autopairs')
    }
    use {
        "b0o/schemastore.nvim",
        after = 'nvim-lsp-installer'
    }

    -- Version Control
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        disable = not is_enabled('gitsigns'),
        event = 'BufRead',
        config = "require'plugins.config.gitsigns'"
    }

    -- Terminal Integration
    use {
        'akinsho/nvim-toggleterm.lua',
        disable = not is_enabled('toggleterm'),
        config = "require'plugins.config.toggleterm'"
    }

    -- Navigation
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        cmd = "Telescope",
        disable = not is_enabled('telescope'),
        config = "require'plugins.config.telescope'"
    }
    use {
        'kyazdani42/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        disable = not is_enabled('nvim_tree'),
        config = "require'plugins.config.nvimtree'"
    }
    use {
        'nvim-telescope/telescope-ui-select.nvim',
        disable = not is_enabled('telescope')
    }

    -- Other
    use {
        'terrortylor/nvim-comment',
        cmd = "CommentToggle",
        config = "require('nvim_comment').setup()",
        disable = not is_enabled('nvim_comment')
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        disable = not is_enabled('null_ls'),
        config = "require'plugins.config.null-ls'",
        event = "InsertEnter"
    }
    use {
        'folke/which-key.nvim',
        event = "BufWinEnter"
    }

    -- Find and replace
    use "windwp/nvim-spectre"

    -- dap
    use {
        'mfussenegger/nvim-dap',
        requires = {'rcarriga/nvim-dap-ui', 'theHamsta/nvim-dap-virtual-text', 'nvim-telescope/telescope-dap.nvim'},
        config = "require'plugins.config.dap'"
    }
    use {"mfussenegger/nvim-jdtls"}
    use {
        'Pocco81/DAPInstall.nvim',
        config = "require'plugins.config.dapinstall'"
    }

    use {
        "simrat39/symbols-outline.nvim",
        event = "BufRead"
    }

    use {
        "github/copilot.vim",
        event = "BufRead",
        config = "require'plugins.config.copilot'"
    }
    for _, plugin in pairs(Modx.plugins.user) do
        use(plugin)
    end
end)
