-- Install lazylazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Fixes Notify opacity issues
vim.o.termguicolors = true

require("lazy").setup({
	-- theme
	{ "catppuccin/nvim", as = "catppuccin", priority = 1000 },

	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				enabled = false,
			})
		end,
	},
	-- Nicer Command Line for neovim
	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				-- add any options here
				routes = {
					{
						filter = {
							event = "msg_show",
							any = {
								{ find = "%d+L, %d+B" },
								{ find = "; after #%d+" },
								{ find = "; before #%d+" },
								{ find = "%d fewer lines" },
								{ find = "%d more lines" },
							},
						},
						opts = { skip = true },
					},
				},
			})
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-ui",
	"kristijanhusak/vim-dadbod-completion",
	-- Database
	{
		"tpope/vim-dadbod",
		opt = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		requires = {
			"kristijanhusak/vim-dadbod-ui",
			"kristijanhusak/vim-dadbod-completion",
		},
		config = function()
			require("plugins.dadbod").setup()
		end,
	},

	-- Fancier statusline
	"nvim-lualine/lualine.nvim",

	-- Fuzzy Finder
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	-- Lua
	{
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
				default_shift_tab = "<C-d>", -- reverse shift default action,
				enable_backwards = true, -- well ...
				completion = true, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
				exclude = {}, -- tabout will ignore these filetypes
			})
		end,
		wants = { "nvim-treesitter" }, -- or require if not used so far
		after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
	},
	-- LSP Configuration & Plugins
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- Install or Upgrade third-party tools
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			-- Useful status updates for LSP
			"j-hui/fidget.nvim",
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-buffer" },
			{ "onsails/lspkind.nvim" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		},
		requires = {
			{
				"KadoBOT/cmp-plugins",
				config = function()
					require("cmp-plugins").setup({
						files = { ".*\\.lua" }, -- default
						-- files = { "plugins.lua", "some_path/plugins/" } -- Recommended: use static filenames or partial paths
					})
				end,
			},
		},
	},

	-- Dashboard
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function() end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	-- which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- Better Tabs for Buffers
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},

	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	-- toggleterm
	{ "akinsho/toggleterm.nvim", version = "*", config = true },

	-- surround
	"tpope/vim-surround",

	-- transparency
	"xiyaowong/transparent.nvim",

	-- show all the troubles the code causes
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function() end,
	},

	-- better comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	-- Git Signs
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Neorg - Alternative to org mode
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/Documents/neorg",
							},
						},
					},
				},
			})
		end,
	},

	-- Angry Reviewer - suggestions for better writing
	"anufrievroman/vim-angry-reviewer",

	-- Translation
	"potamides/pantran.nvim",

	-- Scrollbar
	"petertriho/nvim-scrollbar",

	-- minimap
	{
		"wfxr/minimap.vim",
		config = function()
			vim.g.minimap_width = 25
		end,
	},

	-- Snippets for Many different things
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},

	-- Email client
	{
		url = "https://git.sr.ht/%7Esoywod/himalaya-vim",
		config = function()
			vim.g.himalaya_executable = "/usr/bin/himalaya"
			vim.g.himalaya_folder_picker = "telescope"
		end,
	},

	-- Telescope Plugin for luasnip
	{
		"benfowler/telescope-luasnip.nvim",
		module = "telescope._extensions.luasnip", -- if you wish to lazy-load
	},

	-- Telescope Plugin for tmux
	{
		"camgraff/telescope-tmux.nvim",
	},

	-- Telescope Plugin for finding repos
	{
		"cljoly/telescope-repo.nvim",
	},

	-- Telescope Plugin for Terraform
	{
		"angkeith/telescope-terraform-doc.nvim",
	},

	-- Telescope Plugin for cheat.sh
	-- NOTE: ~/.local/share/nvim/databases has to be created
	{
		"nvim-telescope/telescope-cheat.nvim",
		dependencies = {
			"kkharji/sqlite.lua",
			"nvim-telescope/telescope.nvim",
		},
	},

	-- Telescope Plugin for file browser
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	-- Telescope Plugin for Docker
	"lpoto/telescope-docker.nvim",

	-- Telescope Plugin for Texsuite
	"cagve/telescope-texsuite",

	-- Telescope Plugin for Bibtex
	"nvim-telescope/telescope-bibtex.nvim",

	-- oil.nvim - filesystem editing in a buffer
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- image preview in telescope
	{
		"nvim-telescope/telescope-media-files.nvim",
		dependencies = { "nvim-lua/popup.nvim" },
	},

	-- image preview directly in a file
	-- works only in Kitty / Wezterm
	-- sudo luarocks install magick --lua-version 5.1
	-- copy /root/.luarocks to user folder and chown to user permissions
	{
		"https://github.com/3rd/image.nvim",
	},

	-- ollama integration in nvim
	"David-Kunz/gen.nvim",

	-- indentation
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- lazygit
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- zen for distraction free programming / writing etc.
	-- with twilight as integration
	"folke/zen-mode.nvim",
	"folke/twilight.nvim",

	-- preview of definitions
	-- TODO: understand first b4 using
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
		end,
	},

	-- automatically adjusting shiftwidth and expandtab
	"tpope/vim-sleuth",

	-- Gitlab
	-- go needs to be installed
	{
		"harrisoncramer/gitlab.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
			"nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
		},
		enabled = true,
		build = function()
			require("gitlab.server").build(true)
		end, -- Builds the Go binary
		config = function()
			require("gitlab").setup()
		end,
	},

	-- better searches
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{ "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			{ "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					bash = { "shellcheck", "shellharden", "beautysh" },
					bibtex = { "bibtex-tidy" },
					latex = { "latexindent" },
					lua = { "stylua" },
					puppet = { "puppet-lint" },
					python = { "isort", "black" },
					ruby = { "rubocop", "rubyfmt" },
					sql = { "sql_formatter", "sqlfluff" },
					yaml = { "yamlfix" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
			})
		end,
	},
	-- Linting
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				bash = { "shellcheck" },
				latex = { "chktex" },
				lua = { "luacheck" },
				puppet = { "puppet-lint" },
				ruby = { "ruby", "rubocop" },
				sql = { "sqlfluff" },
				yaml = { "yamllint" },
			}
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},

	-- Autosaving
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				-- your config goes here
				-- or just leave it empty :)
			})
		end,
	},

	-- Obsidian.md
	{
		"epwalsh/obsidian.nvim",
		tag = "*", -- recommended, use latest release instead of latest commit
		requires = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "personal",
						path = "~/Documents/obsidian",
					},
				},
				ui = {
					enable = false,
				},
			})
		end,
	},
})
