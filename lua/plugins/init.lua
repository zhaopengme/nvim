local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
    execute("packadd packer.nvim")
end

local packer = Modx.utils.plugins.require("packer")

packer.init(Modx.plugins.packer.init)

local function is_enabled(plugin)
    return Modx.plugins[plugin].enabled
end

local function get_cmp()
    if Modx.plugins.cmp.enabled == true then
        return "nvim-cmp"
    else
        return
    end
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    -- Syntax Highlighting and Visual Plugins
    use({
        "norcalli/nvim-colorizer.lua",
        disable = not is_enabled("colorizer"),
        config = "require'plugins.config.colorizer'",
        event = "BufRead"
    })
    use({
        "akinsho/nvim-bufferline.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = "require'plugins.config.bufferline'",
        disable = not is_enabled("bufferline"),
        event = "BufWinEnter"
    })
    use({
        "nvim-lualine/lualine.nvim",
        disable = not is_enabled("lualine"),
        config = "require'plugins.config.lualine'",
        event = "BufWinEnter"
    })
    use({
        "goolord/alpha-nvim",
        disable = not is_enabled("dashboard"),
        config = "require'plugins.config.dashboard'",
        event = "BufWinEnter"
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        -- disable = not is_enabled("indent_blankline"),
        disable = true,
        config = "require'plugins.config.blankline'",
        event = "BufRead"
    })
    use({
        "folke/zen-mode.nvim",
        config = "require'plugins.config.zen-mode'",
        disable = not is_enabled("zen_mode"),
        cmd = "ZenMode"
    })
    use({
        "folke/twilight.nvim",
        config = "require'plugins.config.twilight'",
        disable = not is_enabled("twilight"),
        cmd = "ZenMode"
    })

    use({"mangeshrex/uwu.vim"})
    -- Tree-Sitter
    use({
        "nvim-treesitter/nvim-treesitter",
        event = "BufWinEnter",
        run = ":TSUpdate",
        disable = not is_enabled("treesitter"),
        config = "require'plugins.config.treesitter'"
    })
    use({
        "p00f/nvim-ts-rainbow",
        disable = not is_enabled("treesitter"),
        after = "nvim-treesitter"
    })
    use({
        "windwp/nvim-ts-autotag",
        disable = not is_enabled("treesitter"),
        after = "nvim-treesitter"
    })

    -- Colorschemes
    use({
        "rose-pine/neovim",
        as = "rose-pine",
        opt = true
    })
    use({
        "joshdick/onedark.vim",
        opt = true
    })
    use({
        "gruvbox-community/gruvbox",
        opt = true
    })
    use({
        "shaunsingh/nord.nvim",
        opt = true
    })
    use({
        "folke/tokyonight.nvim",
        opt = true
    })
    use({
        "dracula/vim",
        as = "dracula",
        opt = true
    })
    use({
        "tiagovla/tokyodark.nvim",
        opt = true
    })

    -- LSP and Autocomplete
    use({
        "neovim/nvim-lspconfig",
        event = "BufRead"
    })
    use({"williamboman/nvim-lsp-installer"})
    use({"onsails/lspkind-nvim"})
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.config.cmp")
        end,
        disable = not is_enabled("cmp")
    })
    use({
        "hrsh7th/cmp-nvim-lsp",
        disable = not is_enabled("cmp")
    })
    use({
        "hrsh7th/cmp-buffer",
        after = "nvim-cmp",
        disable = not is_enabled("cmp")
    })
    use({
        "uga-rosa/cmp-dictionary",
        disable = not is_enabled("cmp")
    })
    use({
        "hrsh7th/vim-vsnip",
        disable = not is_enabled("cmp"),
        after = "nvim-cmp"
    })
    use({
        "windwp/nvim-autopairs",
        after = get_cmp(),
        config = "require'plugins.config.autopairs'",
        disable = not is_enabled("autopairs")
    })
    use({
        "b0o/schemastore.nvim",
        after = "nvim-lsp-installer"
    })

    -- Version Control
    use({
        "lewis6991/gitsigns.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        disable = not is_enabled("gitsigns"),
        event = "BufRead",
        config = "require'plugins.config.gitsigns'"
    })

    -- Terminal Integration
    use({
        "akinsho/nvim-toggleterm.lua",
        disable = not is_enabled("toggleterm"),
        config = "require'plugins.config.toggleterm'"
    })

    -- Navigation
    use({
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
        cmd = "Telescope",
        disable = not is_enabled("telescope"),
        config = "require'plugins.config.telescope'"
    })
    use({
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        disable = not is_enabled("nvim_tree"),
        config = "require'plugins.config.nvimtree'"
    })

    use("stevearc/dressing.nvim")

    use({
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = "require('nvim_comment').setup()",
        disable = not is_enabled("nvim_comment")
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        disable = not is_enabled("null_ls"),
        config = "require'plugins.config.null-ls'",
        event = "InsertEnter"
    })
    use({
        "folke/which-key.nvim",
        event = "BufWinEnter"
    })

    -- Find and replace
    use({
        "windwp/nvim-spectre",
        config = function()
            require('spectre').setup({

                color_devicons = true,
                open_cmd = 'vnew',
                live_update = false, -- auto excute search again when you write any file in vim
                line_sep_start = '┌-----------------------------------------',
                result_padding = '¦  ',
                line_sep = '└-----------------------------------------',
                highlight = {
                    ui = "String",
                    search = "DiffChange",
                    replace = "DiffDelete"
                },
                mapping = {
                    ['toggle_line'] = {
                        map = "dd",
                        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
                        desc = "toggle current item"
                    },
                    ['enter_file'] = {
                        map = "<cr>",
                        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
                        desc = "goto current file"
                    },
                    ['send_to_qf'] = {
                        map = "<leader>q",
                        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
                        desc = "send all item to quickfix"
                    },
                    ['replace_cmd'] = {
                        map = "<leader>c",
                        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
                        desc = "input replace vim command"
                    },
                    ['show_option_menu'] = {
                        map = "<leader>o",
                        cmd = "<cmd>lua require('spectre').show_options()<CR>",
                        desc = "show option"
                    },
                    ['run_replace'] = {
                        map = "<leader>R",
                        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
                        desc = "replace all"
                    },
                    ['change_view_mode'] = {
                        map = "<leader>v",
                        cmd = "<cmd>lua require('spectre').change_view()<CR>",
                        desc = "change result view mode"
                    },
                    ['toggle_live_update'] = {
                        map = "tu",
                        cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
                        desc = "update change when vim write file."
                    },
                    ['toggle_ignore_case'] = {
                        map = "ti",
                        cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
                        desc = "toggle ignore case"
                    },
                    ['toggle_ignore_hidden'] = {
                        map = "th",
                        cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
                        desc = "toggle search hidden"
                    }
                    -- you can put your mapping here it only use normal mode
                }

            })

        end
    })

    -- dap
    use({
        "mfussenegger/nvim-dap",
        requires = {"rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text", "nvim-telescope/telescope-dap.nvim"},
        config = "require'plugins.config.dap'"
    })
    use({"mfussenegger/nvim-jdtls"})
    use({
        "Pocco81/DAPInstall.nvim",
        config = "require'plugins.config.dapinstall'"
    })

    use({
        "simrat39/symbols-outline.nvim",
        event = "BufRead"
    })

    use({
        "github/copilot.vim",
        event = "BufRead",
        config = "require'plugins.config.copilot'"
    })

    use("ggandor/lightspeed.nvim")

    -- lua with packer.nvim
    use({
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end
    })
    for _, plugin in pairs(Modx.plugins.user) do
        use(plugin)
    end
end)
