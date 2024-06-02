-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

--
-- which-key Settings
--

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {

	-- nvim-tree
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	-- hide searches
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	-- getting out of files
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },

	-- Angry Reviewer, AI (ollama/gen.nvim)
	a = {
		name = "AngryReviwer",
		r = { "<cmd>AngryReviewer<cr>", "AngryReviewer" },
		n = { "<cmd>cnext<cr>", "Next" },
		p = { "<cmd>cprev<cr>", "Previous" },
		c = { "<cmd>cclose<cr>", "Close" },
		o = { "<cmd>copen<cr>", "Open" },
	},

	-- comments
	c = {
		name = "Comments",
		n = { "<cmd>lua require('todo-comments').jump_next()<cr>", "Next Comment" },
		p = { "<cmd>lua require('todo-comments').jump_prev()<cr>", "Previous Comment" },
	},

	-- mostly telescope
	f = {
		name = "Telescope",
		b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
		d = { "<cmd>Telescope docker<cr>", "Docker" },
		C = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer Grep" },
		f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
		g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep" },
		h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" },
		n = { "<cmd>Telescope notify<cr>", "Notifications" },
		s = { "<cmd>Telescope luasnip<cr>", "Luasnip" },
	},

	-- git
	g = {
		name = "Git/Goto/Gitlab",
		D = { "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", "Definition" },
		g = { "<cmd>LazyGit<cr>", "Lazygit" },
		r = { "<cmd>lua require('gitlab').review()<cr>", "Review" },
		c = { "<cmd>lua require('gitlab').create_comment()<cr>", "Create Comment" },
		C = { "<cmd>lua require('gitlab').create_multiline_comment()<cr>", "Create MultilineComment" },
		S = { "<cmd>lua require('gitlab').create_comment_suggestion()<cr>", "Create Suggestion" },
		d = { "<cmd>lua require('gitlab').toggle_discussions()<cr>", "Toggle Discussion" },
		s = { "<cmd>lua require('gitlab').summary()<cr>", "Gitlab Summary" },
		a = { "<cmd>lua require('gitlab').approve()<cr>", "Approve" },
		A = { "<cmd>lua require('gitlab').add_assignee()<cr>", "Add Assignee" },
		da = { "<cmd>lua require('gitlab').delete_assignee()<cr>", "Delete Assignee" },
		ar = { "<cmd>lua require('gitlab').add_reviewer()<cr>", "Add Reviewer" },
		dr = { "<cmd>lua require('gitlab').delete_reviewer()<cr>", "Delete Reviewer" },
		p = { "<cmd>lua require('gitlab').pipeline()<cr>", "Pipeline" },
		o = { "<cmd>lua require('gitlab').open_in_browser()<cr>", "Open in Browser" },
		m = { "<cmd>lua require('gitlab').merge()<cr>", "Merge" },
		md = { "<cmd>lua require('gitlab').move_to_discussion_tree_from_diagnostic()<cr>", "Move to Discussion" },
	},

	-- Lazy
	l = {
		name = "Lazy/Latex",
		l = { "<cmd>Lazy<cr>", "Lazy" },
		c = { "<cmd>Telescope texsuite newcommands<cr>", "Tex newcommaneds" },
		L = { "<cmd>Telescope texsuite labels<cr>", "Tex labels" },
		h = { "<cmd>Telescope texsuite headings<cr>", "Tex headings" },
		f = { "<cmd>Telescope texsuite frames<cr>", "Tex Frames" },
	},

	-- mail / himalaya
	m = {
		name = "Mail/Minimap",
		c = { "<cmd>HimalayaCopy<cr>", "Copy Mail" },
		m = { "<cmd>HimalayaMove<cr>", "Move Mail" },
		n = { "<cmd>HimalayaNextPage<cr>", "Next Page" },
		p = { "<cmd>HimalayaPreviousPage<cr>", "Previous Page" },
		g = { "<cmd>HimalayaFolders<cr>", "Folders" },
		w = { "<cmd>HimalayaWrite<cr>", "Write Mail" },
		r = { "<cmd>HimalayaReply<cr>", "Reply" },
		R = { "<cmd>HimalayaReplyAll<cr>", "Reply All" },
		f = { "<cmd>HimalayaForward<cr>", "Forward" },
		a = { "<cmd>HimalayaAttachments<cr>", "Download Attachments" },
		D = { "<cmd>HimalayaDelete<cr>", "Delete Mail" },
		M = { "<cmd>MinimapToggle<cr>", "Minimap Toggle" },
	},

	-- snippets
	s = {
		name = "Snippets",
		s = { "<cmd>Telescope luasnip<cr>", "Search" },
	},

	-- toggleterm tmux translate
	t = {
		name = "Terminal/tmux/translate",
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		r = { "<cmd>Pantran<cr>", "Translate" },
		rr = { "<cmd>Pantran.motion_translate()<cr>", "Translate Selected Text" },
	},

	-- trouble
	x = {
		name = "Trouble",
		x = { "<cmd>TroubleToggle<cr>", "Toggle" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
		l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
		r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
	},

	z = {
		name = "Zen",
		z = { "<cmd>ZenMode<cr>", "ZenMode" },
	},
}

which_key.register(mappings, opts)

local map = vim.api.nvim_set_keymap
local barbar_opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", barbar_opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", barbar_opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", barbar_opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", barbar_opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", barbar_opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", barbar_opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", barbar_opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", barbar_opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", barbar_opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", barbar_opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", barbar_opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", barbar_opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", barbar_opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", barbar_opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", barbar_opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", barbar_opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<A-p>", "<Cmd>BufferPick<CR>", barbar_opts)
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", barbar_opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", barbar_opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", barbar_opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", barbar_opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
