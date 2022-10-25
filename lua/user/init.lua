local config = {
    updater = {
        remote = "origin", -- remote to use
        channel = "nightly", -- "stable" or "nightly"
        version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "main", -- branch name (NIGHTLY ONLY)
        commit = nil, -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false, -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_reload = false, -- automatically reload and sync packer after a successful update
        auto_quit = false -- automatically quit the current session after a successful update
    },

    colorscheme = "default_theme",
    -- colorscheme = "dayfox",
    highlights = {
        -- init = { -- this table overrides highlights in all themes
        --   Normal = { bg = "#000000" },
        -- }
        -- duskfox = { -- a table of overrides/changes to the duskfox theme
        --   Normal = { bg = "#000000" },
        -- },
    },

    -- set vim options here (vim.<first_key>.<second_key> =  value)
    options = {
        opt = {
            -- set to true or false etc.
            relativenumber = true, -- sets vim.opt.relativenumber
            number = true, -- sets vim.opt.number
            spell = false, -- sets vim.opt.spell
            signcolumn = "auto", -- sets vim.opt.signcolumn to auto
            wrap = true -- sets vim.opt.wrap
        },
        g = {
            mapleader = " ", -- sets vim.g.mapleader
            autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
            cmp_enabled = true, -- enable completion at start
            autopairs_enabled = true, -- enable autopairs at start
            diagnostics_enabled = true, -- enable diagnostics at start
            status_diagnostics_enabled = true, -- enable diagnostics in statusline
            icons_enabled = true -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        }
    },
    -- If you need more control, you can use the function()...end notation
    -- options = function(local_vim)
    --   local_vim.opt.relativenumber = true
    --   local_vim.g.mapleader = " "
    --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
    --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
    --
    --   return local_vim
    -- end,

    -- Set dashboard header
    header = {

        [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣡⣾⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣟⠻⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⡿⢫⣷⣿⣿⣿⣿⣿⣿⣿⣾⣯⣿⡿⢧⡚⢷⣌⣽⣿⣿⣿⣿⣿⣶⡌⣿⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣇⣘⠿⢹⣿⣿⣿⣿⣿⣻⢿⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣻⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⡇⠀⣬⠏⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⠀⠈⠁⠀⣿⡇⠘⡟⣿⣿⣿⣿⣿⣿⣿⣿⡏⠿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⡏⠀⠀⠐⠀⢻⣇⠀⠀⠹⣿⣿⣿⣿⣿⣿⣩⡶⠼⠟⠻⠞⣿⡈⠻⣟⢻⣿⣿⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢿⠀⡆⠀⠘⢿⢻⡿⣿⣧⣷⢣⣶⡃⢀⣾⡆⡋⣧⠙⢿⣿⣿⣟⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⡥⠂⡐⠀⠁⠑⣾⣿⣿⣾⣿⣿⣿⡿⣷⣷⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿]],
        [[⣿⣿⡿⣿⣍⡴⠆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣄⣀⣷⡄⣙⢿⣿⣿⣿⣿⣯⣶⣿⣿⢟⣾⣿⣿⢡⣿⣿⣿⣿⣿]],
        [[⣿⡏⣾⣿⣿⣿⣷⣦⠀⠀⠀⢀⡀⠀⠀⠠⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣡⣾⣿⣿⢏⣾⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⣿⣿⣿⣿⣿⡴⠀⠀⠀⠀⠀⠠⠀⠰⣿⣿⣿⣷⣿⠿⠿⣿⣿⣭⡶⣫⠔⢻⢿⢇⣾⣿⣿⣿⣿⣿⣿]],
        [[⣿⣿⣿⡿⢫⣽⠟⣋⠀⠀⠀⠀⣶⣦⠀⠀⠀⠈⠻⣿⣿⣿⣾⣿⣿⣿⣿⡿⣣⣿⣿⢸⣾⣿⣿⣿⣿⣿⣿⣿]],
        [[⡿⠛⣹⣶⣶⣶⣾⣿⣷⣦⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⡿⠫⠾⠿⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⡆⣠⢀⣴⣏⡀⠀⠀⠀⠉⠀⠀⢀⣠⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⠿⠛⠛⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣯⣟⠷⢷⣿⡿⠋⠀⠀⠀⠀⣵⡀⢠⡿⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⢿⣿⣿⠂⠀⠀⠀⠀⠀⢀⣽⣿⣿⣿⣿⣿⣿⣿⣍⠛⠿⣿⣿⣿⣿⣿⣿]],

    },

    -- Default theme configuration
    default_theme = {
        -- Modify the color palette for the default theme
        colors = {fg = "#abb2bf", bg = "#1e222a"},
        highlights = function(hl) -- or a function that returns a new table of colors to set
            local C = require "default_theme.colors"

            hl.Normal = {fg = C.fg, bg = C.bg}

            -- New approach instead of diagnostic_style
            hl.DiagnosticError.italic = true
            hl.DiagnosticHint.italic = true
            hl.DiagnosticInfo.italic = true
            hl.DiagnosticWarn.italic = true

            return hl
        end,
        -- enable or disable highlighting for extra plugins
        plugins = {
            aerial = true,
            beacon = false,
            bufferline = true,
            cmp = true,
            dashboard = true,
            highlighturl = true,
            hop = true,
            indent_blankline = true,
            lightspeed = false,
            ["neo-tree"] = true,
            notify = true,
            ["nvim-tree"] = false,
            ["nvim-web-devicons"] = true,
            rainbow = true,
            symbols_outline = true,
            telescope = true,
            treesitter = true,
            vimwiki = false,
            ["which-key"] = true
        }
    },

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {virtual_text = true, underline = true},

    -- Extend LSP configuration
    lsp = {
        -- enable servers that you already have installed without mason
        servers = {
            -- "pyright"
        },
        formatting = {
            -- control auto formatting on save
            format_on_save = {
                enabled = true, -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    -- "go",
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    -- "python",
                }
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                -- "sumneko_lua",
            },
            timeout_ms = 1000 -- default format timeout
            -- filter = function(client) -- fully override the default formatting function
            --   return true
            -- end
        },
        -- easily add or disable built in mappings added during LSP attaching
        mappings = {
            n = {
                -- ["<leader>lf"] = false -- disable formatting keymap
                ["f"] = {"<cmd>HopWord<cr>", desc = "quick go to HopWord"},
                ["<C-f>"] = {
                    "<cmd>SearchBoxIncSearch<cr>",
                    desc = "SearchBoxIncSearch"
                } -- change description but the same command
            }
        },
        -- add to the global LSP on_attach function
        -- on_attach = function(client, bufnr)
        -- end,

        -- override the mason server-registration function
        -- server_registration = function(server, opts)
        --   require("lspconfig")[server].setup(opts)
        -- end,

        -- Add overrides for LSP server settings, the keys are the name of the server
        ["server-settings"] = {
            -- example for addings schemas to yamlls
            -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
            --   settings = {
            --     yaml = {
            --       schemas = {
            --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
            --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
            --       },
            --     },
            --   },
            -- },
        }
    },

    -- Mapping data with "desc" stored directly by vim.keymap.set().
    --
    -- Please use this mappings table to set keyboard mapping since this is the
    -- lower level configuration and more robust one. (which-key will
    -- automatically pick-up stored data by this setting.)
    mappings = {
        -- first key is the mode
        n = {
            -- second key is the lefthand side of the map
            -- mappings seen under group name "Buffer"
            ["<leader>bb"] = {"<cmd>tabnew<cr>", desc = "New tab"},
            ["<leader>bc"] = {
                "<cmd>BufferLinePickClose<cr>",
                desc = "Pick to close"
            },
            ["<leader>bj"] = {"<cmd>BufferLinePick<cr>", desc = "Pick to jump"},
            ["<leader>bt"] = {
                "<cmd>BufferLineSortByTabs<cr>",
                desc = "Sort by tabs"
            },
            ["<leader>lt"] = {"<cmd>TroubleToggle<cr>", desc = "TroubleToggle"},
            ["<C-\\>"] = {"<cmd>ToggleTerm<cr>", desc = "ToggleTerm"}
            -- quick save
            -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        },
        t = {
            -- setting a mapping to false will disable it
            -- ["<esc>"] = false,
            ["<C-\\>"] = {"<cmd>ToggleTerm<cr>", desc = "ToggleTerm"}
        }
    },

    -- Configure plugins
    plugins = {
        init = {
            -- You can disable default plugins as follows:
            -- ["goolord/alpha-nvim"] = { disable = true },

            -- You can also add new plugins here as well:
            -- Add plugins, the packer syntax without the "use"
            -- { "andweeb/presence.nvim" },
            -- {
            --   "ray-x/lsp_signature.nvim",
            --   event = "BufRead",
            --   config = function()
            --     require("lsp_signature").setup()
            --   end,
            -- },

            -- We also support a key value style plugin definition similar to NvChad:
            -- ["ray-x/lsp_signature.nvim"] = {
            --   event = "BufRead",
            --   config = function()
            --     require("lsp_signature").setup()
            --   end,
            -- },
            {
                "hrsh7th/cmp-vsnip",
                after = "nvim-cmp",
                config = function()
                    astronvim.add_user_cmp_source "vsnip"
                end
            }, {
                "zbirenbaum/copilot.lua",
                after = "nvim-cmp",
                config = function()
                    vim.defer_fn(function()
                        require("copilot").setup()
                    end, 100)
                end
            }, {
                "zbirenbaum/copilot-cmp",
                after = {"copilot.lua", "nvim-cmp"},
                config = function()
                    require("copilot_cmp").setup {
                        method = "getCompletionsCycling",
                        formatters = {
                            label = require("copilot_cmp.format").format_label_text,
                            insert_text = require("copilot_cmp.format").format_insert_text,
                            preview = require("copilot_cmp.format").deindent
                        }
                    }
                    astronvim.add_user_cmp_source {
                        name = "copilot",
                        priority = 9000
                    }
                end
            }, {
                "phaazon/hop.nvim",
                event = "BufRead",
                branch = "v2", -- optional but strongly recommended
                config = function()
                    -- you can configure Hop the way you like here; see :h hop-config
                    require("hop").setup {keys = "etovxqpdygfblzhckisuran"}
                end
            }, {"mg979/vim-visual-multi", branch = "master"},
            {
                "VonHeikemen/searchbox.nvim",
                requires = {{"MunifTanjim/nui.nvim"}}
            }, {
                "folke/trouble.nvim",
                requires = "kyazdani42/nvim-web-devicons",
                config = function() require("trouble").setup {} end
            }, {
                "EdenEast/nightfox.nvim",
                config = function()
                    require("nightfox").setup {
                        -- disable extra plugins that AstroNvim doesn't use (this is optional)
                        modules = {
                            barbar = true,
                            dashboard = true,
                            fern = true,
                            fidget = true,
                            gitgutter = true,
                            glyph_palette = true,
                            illuminate = true,
                            lightspeed = true,
                            lsp_saga = true,
                            lsp_trouble = true,
                            modes = true,
                            neogit = true,
                            nvimtree = true,
                            pounce = true,
                            sneak = true,
                            symbols_outline = true
                        },
                        groups = {
                            all = {
                                -- add highlight group for AstroNvim's built in URL highlighting
                                HighlightURL = {style = "underline"}
                            }
                        }
                    }
                end
            }, {
                'samodostal/image.nvim',
                requires = {'nvim-lua/plenary.nvim'},
                config = function()
                    require('image').setup {
                        render = {
                            min_padding = 5,
                            show_label = true,
                            use_dither = true,
                            foreground_color = false,
                            background_color = false
                        },
                        events = {update_on_nvim_resize = true}
                    }
                end
            },
            {
                "mfussenegger/nvim-dap",
                config = function()
                  local dap = require "dap"
                  dap.adapters = {
                    python = {
                      type = "executable",
                      command = "/usr/bin/python3",
                      args = { "-m", "debugpy.adapter" },
                    },
                    cppdbg = {
                      id = "cppdbg",
                      type = "executable",
                      name = "cppdbg",
                      command = "OpenDebugAD7",
                    },
                    lldb = {
                      type = "executable",
                      command = "/usr/lib/llvm-10/bin/lldb-vscode", -- adjust as needed, must be absolute path
                      name = "lldb",
                    },
                  }
                  dap.configurations = {
                    python = {
                      {
                        type = "python",
                        request = "launch",
                        name = "Launch file",
                        program = "${file}",
                        pythonPath = function() return "/usr/bin/python3" end,
                      },
                    },
                    cpp = {
                      {
                        name = "Launch file",
                        type = "cppdbg",
                        request = "launch",
                        program = function() return vim.fn.input("Path to executable: ", vim.fn.expand "%:p" .. "/", "file") end,
                        cwd = "${workspaceFolder}",
                        stopOnEntry = true,
                        setupCommands = {
                          {
                            description = "Enable pretty-printing",
                            text = "-enable-pretty-printing",
                            ignoreFailures = false,
                          },
                        },
                        runInTerminal = true,
                      },
                    },
                  }
                  -- get notify
                  local function start_session(_, _)
                    local info_string = string.format("%s", dap.session().config.program)
                    vim.notify(info_string, "debug", { title = "Debugger Started", timeout = 500 })
                  end

                  local function terminate_session(_, _)
                    local info_string = string.format("%s", dap.session().config.program)
                    vim.notify(info_string, "debug", { title = "Debugger Terminated", timeout = 500 })
                  end

                  dap.listeners.after.event_initialized["dapui"] = start_session
                  dap.listeners.before.event_terminated["dapui"] = terminate_session
                  -- Define symbols
                  vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
                  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
                  vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
                  vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
                  vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })
                end,
              },
              {
                "rcarriga/nvim-dap-ui",
                after = "nvim-dap",
                config = function()
                  -- require("dapui").setup()
                  local dap, dapui = require "dap", require "dapui"
                  dapui.setup {
                    icons = { expanded = "▾", collapsed = "▸" },
                    mappings = {
                      expand = "<cr>",
                      open = "o",
                      remove = "d",
                      edit = "e",
                      repl = "r",
                      toggle = "t",
                    },
                    layouts = {
                      {
                        elements = {
                          { id = "watches", size = 0.5 },
                          { id = "scopes", size = 0.5 },
                          { id = "breakpoints", size = 0.25 },
                          { id = "stacks", size = 0.25 },
                        },
                        size = 40,
                        position = "left",
                      },
                      {
                        elements = { "repl" },
                        size = 10,
                        position = "bottom",
                      },
                    },
                    floating = {
                      border = "single",
                      mappings = {
                        close = { "q", "<esc>" },
                      },
                    },
                    windows = { indent = 1 },
                  }
                  -- add listeners to auto open DAP UI
                  dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
                  -- dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
                  -- dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
                end,
              },
              {
                "theHamsta/nvim-dap-virtual-text",
                after = "nvim-dap",
                config = function() require("nvim-dap-virtual-text").setup() end,
              },
              {
                'leoluz/nvim-dap-go',
                after = "nvim-dap",
                config = function() require('dap-go').setup() end,
              }

        },
        -- All other entries override the require("<key>").setup({...}) call for default plugins
        ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
            -- config variable is the default configuration table for the setup function call
            -- local null_ls = require "null-ls"

            -- Check supported formatters and linters
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
            config.sources = {
                -- null_ls.builtins.formatting.eslint_d,
                -- null_ls.builtins.code_actions.eslint_d,
                -- null_ls.builtins.diagnostics.eslint_d,
                -- null_ls.builtins.diagnostics.luacheck,
                -- null_ls.builtins.diagnostics.mypy,
                -- null_ls.builtins.code_actions.shellcheck,
                -- null_ls.builtins.completion.tags,
                -- null_ls.builtins.formatting.markdownlint,
                -- null_ls.builtins.formatting.prettier,
                -- null_ls.builtins.formatting.terrafmt,
                -- null_ls.builtins.formatting.terraform_fmt,
                -- null_ls.builtins.formatting.gofumpt,
                -- null_ls.builtins.formatting.shfmt,
                -- null_ls.builtins.diagnostics.tsc,
            }
            return config -- return final config table
        end,
        treesitter = { -- overrides `require("treesitter").setup(...)`
            ensure_installed = "all"
        },
        -- use mason-lspconfig to configure LSP installations
        ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
            ensure_installed = {
                "cssls", "html", "jsonls", "tsserver", "sumneko_lua",
                "marksman", "pyright", "tailwindcss", "volar"
            },
            automatic_installation = true
        },
        -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
        ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
            ensure_installed = {"prettier", "jq", "markdownlint", "stylua"},
            automatic_installation = true
        },
        lspkind = {symbol_map = {Copilot = ""}},
        ["neo-tree"] = {filesystem = {filtered_items = {visible = true}}}
    },

    -- LuaSnip Options
    luasnip = {
        -- Add paths for including more VS Code style snippets in luasnip
        vscode_snippet_paths = {},
        -- Extend filetypes
        filetype_extend = {
            -- javascript = { "javascriptreact" },
        }
    },

    -- CMP Source Priorities
    -- modify here the priorities of default cmp sources
    -- higher value == higher priority
    -- The value can also be set to a boolean for disabling default sources:
    -- false == disabled
    -- true == 1000
    cmp = {
        -- source_priority = {
        --   nvim_lsp = 1000,
        --   luasnip = 750,
        --   buffer = 500,
        --   path = 250,
        -- },
    },

    -- Modify which-key registration (Use this with mappings table in the above.)
    ["which-key"] = {
        -- Add bindings which show up as group name
        register = {
            -- first key is the mode, n == normal mode
            n = {
                -- second key is the prefix, <leader> prefixes
                ["<leader>"] = {
                    -- third key is the key to bring up next level and its displayed
                    -- group name in which-key top level menu
                    ["d"] = {
                        name = "Debug",
                        ["t"] = {
                          "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
                          "Toggle Breakpoint",
                        },
                        ["b"] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
                        ["c"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
                        ["C"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
                        ["d"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
                        ["g"] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
                        ["i"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
                        ["o"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
                        ["u"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
                        ["p"] = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
                        ["r"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
                        ["s"] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
                        ["q"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
                        ["x"] = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle debug UI" },
                      },
                }
            }
        }
    },

    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    polish = function()
        -- Set up custom filetypes
        -- vim.filetype.add {
        --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
        --     ["Foofile"] = "fooscript",
        --   },
        --   pattern = {
        --     ["~/%.config/foo/.*"] = "fooscript",
        --   },
        -- }
        local function alpha_on_bye(cmd)
            local bufs = vim.fn.getbufinfo {buflisted = true}
            vim.cmd(cmd)
            if require("core.utils").is_available "alpha-nvim" and not bufs[2] then
                require("alpha").start(true)
            end
        end

        vim.keymap.del("n", "<leader>c")
        if require("core.utils").is_available "bufdelete.nvim" then
            vim.keymap.set("n", "<leader>c",
                           function() alpha_on_bye "Bdelete!" end,
                           {desc = "Close buffer"})
        else
            vim.keymap.set("n", "<leader>c",
                           function() alpha_on_bye "bdelete!" end,
                           {desc = "Close buffer"})
        end
    end
}

return config
