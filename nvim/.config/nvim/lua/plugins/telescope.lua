require("telescope").setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key",
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
		terraform_doc = {
			url_open_command = "xdg-open",
			latest_provider_symbol = "  ",
			wincmd = "botright vnew",
			wrap = "nowrap",
		},
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			filetypes = { "png", "webp", "jpg", "jpeg" },
			-- find command (defaults to `fd`)
			find_cmd = "rg",
		},
	},
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
-- Eanble notify extension
pcall(require("telescope").load_extension, "notify")
-- Enable telescope luasnip
pcall(require("telescope").load_extension, "luasnip")
-- Enable telescope tmux
pcall(require("telescope").load_extension, "luasnip")
-- Enable telescope repo finder
pcall(require("telescope").load_extension, "repo")
-- Enable telescope terraform
pcall(require("telescope").load_extension, "terraform_doc")
-- Enable telescope cheat.sh
pcall(require("telescope").load_extension, "cheat")
-- Enable telescope file_browser
pcall(require("telescope").load_extension, "file_browser")
-- Enable media files search
pcall(require("telescope").load_extension, "media_files")
-- Enable docker
pcall(require("telescope").load_extension, "docker")
-- Enalbe Texsuite
pcall(require("telescope").load_extension, "texsuite")
-- Enable Bibtex
pcall(require("telescope").load_extension, "bibtex")

local builtin = require("telescope.builtin")

-- Telescope fix so it does not open files in insert mode
vim.api.nvim_create_autocmd("WinLeave", {
	callback = function()
		if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
		end
	end,
})
