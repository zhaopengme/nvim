local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                      install_path}
end
vim.cmd [[packadd packer.nvim]]

local ok, packer = pcall(require, "packer")

if not ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "single"
            }
        end,
        prompt_border = "single"
    },
    git = {
        clone_timeout = 600
    },
    auto_clean = true,
    compile_on_sync = false
}

return packer.startup(function(use)
    use {"wbthomason/packer.nvim"}

    -- UI
    use {"rmehri01/onenord.nvim"}
    use {
        "goolord/alpha-nvim",
        config = require "plugins.configs.alpha"
    }
    use {
        "kyazdani42/nvim-web-devicons",
        config = require "plugins.configs.icons"
    }
    use {
        "nvim-lualine/lualine.nvim",
        config = require "plugins.configs.lualine",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true
        }
    }
    use {
        "akinsho/bufferline.nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = require "plugins.configs.bufferline"
    }
    use {"folke/which-key.nvim"}
    use {
        "karb94/neoscroll.nvim",
        config = require "plugins.configs.neoscroll"
    }

    -- Syntax
    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {"windwp/nvim-ts-autotag", "p00f/nvim-ts-rainbow"},
        run = ":TSUpdate",
        config = require "plugins.configs.treesitter"
    }

    -- Utilities
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = require "plugins.configs.nvimtree"
    }
    use {
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = require "plugins.configs.telescope"
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = require "plugins.configs.indent"
    }
    use {
        "windwp/nvim-autopairs",
        config = require "plugins.configs.autopairs"
    }
    use {"tpope/vim-surround"}
    use {
        "norcalli/nvim-colorizer.lua",
        config = require "plugins.configs.colorizer"
    }
    use {"RRethy/vim-illuminate"}

    -- LSP
    use {
        "williamboman/nvim-lsp-installer",
        requires = {"neovim/nvim-lspconfig", "jose-elias-alvarez/typescript.nvim", "ray-x/lsp_signature.nvim"}
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = {"nvim-lua/plenary.nvim"}
    }

    use {
        "tami5/lspsaga.nvim",
        config = require "plugins.configs.lspsaga"
    }

    use({
        "github/copilot.vim",
        config = require "plugins.configs.copilot"
    })

    -- dap
    use {
        "mfussenegger/nvim-dap",
        requires = {"rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text", "nvim-telescope/telescope-dap.nvim"},
        config = require "plugins.configs.dap"
    }

    use({
        "zhaopengme/DAPInstall.nvim",
        config = require "plugins.configs.dapinstall"
    })

    -- -- Comment
    use {
        "numToStr/Comment.nvim",
        config = require "plugins.configs.comment"
    }

    -- -- Completion
    use {
        "hrsh7th/nvim-cmp",
        requires = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
                    "hrsh7th/cmp-cmdline", "hrsh7th/cmp-nvim-lsp-document-symbol", "hrsh7th/cmp-vsnip",
                    "hrsh7th/vim-vsnip", "hrsh7th/cmp-nvim-lsp-signature-help"},
        config = require "plugins.configs.cmp"
    }

    -- -- Snippets
    use {"kitagry/vs-snippets"}
    use {
        "dsznajder/vscode-es7-javascript-react-snippets",
        run = "yarn install --frozen-lockfile && yarn compile"
    }

    -- Tmux
    use {
        "aserowy/tmux.nvim",
        config = require "plugins.configs.tmux"
    }

    -- Git
    use {"tpope/vim-fugitive"}
    use {
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = require "plugins.configs.gitsigns"
    }

    use {"kdheepak/lazygit.nvim"}

    -- Markdown
    use {
        "davidgranstrom/nvim-markdown-preview",
        config = function()
            vim.g.nvim_markdown_preview_format = "gfm"
            vim.g.nvim_markdown_preview_theme = "github"
        end
    }

    -- Find and replace
    use {"windwp/nvim-spectre"}

    -- Terminal Integration
    use({
        "akinsho/toggleterm.nvim",
        config = require "plugins.configs.toggleterm"
    })

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
