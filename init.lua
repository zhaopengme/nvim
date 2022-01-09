-- Modx object to use for namespacing
Modx = {
	options = {
		tabwidth = 4,
	},
	language_servers = {
		"bashls",
		"ccls",
		"cmake",
		"cssls",
		"diagnosticls",
		"dockerls",
		"efm",
		"eslint",
		"emmet_ls",
		"gopls",
		"html",
		"jsonls",
		"tsserver",
		"sumneko_lua",
		"intelephense",
		"pyright",
		"sqlls",
		"stylelint_lsp",
		"svelte",
		"tailwindcss",
		"vuels",
		"lemminx",
		"yamlls",
		"rust_analyzer",
	},
	dap_languages = { "rust", "node2", "go" },
	debuggers_list = { "jsnode", "go_delve", "codelldb" },
	plugins = {
		zen_mode = {
			enabled = true,
			enable_rainbow_colors = false,
		},
		twilight = {
			enabled = true,
			enable_rainbow_colors = false,
		},
		indent_blankline = {
			enabled = true,
			enable_rainbow_colors = false,
		},
		colorizer = {
			enabled = true,
		},
		autopairs = {
			enabled = true,
		},
		gitsigns = {
			enabled = true,
		},
		bufferline = {
			enabled = true,
		},
		lualine = {
			enabled = true,
		},
		dashboard = {
			enabled = true,
		},
		toggleterm = {
			enabled = true,
			toggle_float = function()
				local Terminal = Modx.utils.plugins.require("toggleterm.terminal").Terminal
				local float = Terminal:new({
					direction = "float",
				})
				return float:toggle()
			end,
			toggle_lazygit = function()
				local Terminal = require("toggleterm.terminal").Terminal
				local lazygit = Terminal:new({
					cmd = "lazygit",
					direction = "float",
				})
				return lazygit:toggle()
			end,
			which_key = {
				root = "t",
				name = "Terminal",
				definitions = {
					t = { ":ToggleTerm<cr>", "Split Below" },
					f = { "<cmd>lua Modx.plugins.toggleterm.toggle_float()<cr>", "Floating Terminal" },
					g = { "<cmd>lua Modx.plugins.toggleterm.toggle_lazygit()<cr>", "LazyGit" },
				},
			},
		},
		treesitter = {
			enabled = true,
			ensure_installed = "all",
			ignore_install = {},
			indent = {
				enable = false,
			},
			highlight = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = false,
				disable = { "html" },
			},
		},
		vsnip = {
			enabled = true,
		},
		telescope = {
			enabled = true,
		},
		nvim_tree = {
			enabled = true,
		},
		dial = {
			enabled = true,
		},
		null_ls = {
			enabled = true,
		},
		nvim_comment = {
			enabled = true,
		},
		cmp = {
			enabled = true,
			sources = {
				{
					name = "nvim_lsp",
				},
				{
					name = "vsnip",
				},
				{
					name = "buffer",
				},
				{
					name = "omni",
				},
				{
					name = "dictionary",
					keyword_length = 2,
				},
				{
					name = "path",
				},
			},
		},
		which_key = {
			user_defined = {},
		},
		-- Packer-specific needs
		packer = {
			enabled = true,
			-- See vapour/user-config/README.md for an example use of this
			init = {
				display = {
					open_fn = function()
						return Modx.utils.plugins.require("packer.util").float({
							border = "single",
						})
					end,
				},
			},
		},

		-- User-loaded plugins
		user = {},
	},

	-- To update see core.utils
	utils = {},

	settings = {
		-- If true, :w -> :w!
		always_force_write = false,
		colorscheme = "uwu",
		lualine_colorscheme = "gruvbox",
		transparent_bg = false,
	},
}

require("core.utils")

local user_config = vim.fn.stdpath("config") .. "/lua/user-config/init.lua"

if not Modx.utils.file.exists(user_config) then
	Modx.utils.file.create(user_config)
end

-- User config that overrides the above
vim.cmd("luafile " .. user_config)

-- General
require("core.options")
require("plugins")
require("core.keybindings")

-- Syntax and Visual
-- If a custom theme is wanted, require() that in user-config.init
-- Otherwise if the default theme is not wanted change Modx.settings.colorscheme
-- This will return nil if it's not found
if Modx.settings.colorscheme ~= "custom" then
	-- Modx.utils.plugins.require("colorscheme." .. Modx.settings.colorscheme)
	require("colorscheme." .. Modx.settings.colorscheme)
end

-- LSP and Autocomplete
require("core.lsp")

-- Whichkey
require("plugins.config.which-key")
if Modx.settings.transparent_bg then
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
end
