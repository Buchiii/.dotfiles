-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

--
-- which-key Settings
--
--

local wk = require("which-key")
wk.add({
	{ "<leader>a", group = "AngryReviwer", nowait = true, remap = false },
	{ "<leader>ac", "<cmd>cclose<cr>", desc = "Close", nowait = true, remap = false },
	{ "<leader>an", "<cmd>cnext<cr>", desc = "Next", nowait = true, remap = false },
	{ "<leader>ao", "<cmd>copen<cr>", desc = "Open", nowait = true, remap = false },
	{ "<leader>ap", "<cmd>cprev<cr>", desc = "Previous", nowait = true, remap = false },
	{ "<leader>ar", "<cmd>AngryReviewer<cr>", desc = "AngryReviewer", nowait = true, remap = false },
	{ "<leader>c", group = "Comments", nowait = true, remap = false },
	{
		"<leader>cn",
		"<cmd>lua require('todo-comments').jump_next()<cr>",
		desc = "Next Comment",
		nowait = true,
		remap = false,
	},
	{
		"<leader>cp",
		"<cmd>lua require('todo-comments').jump_prev()<cr>",
		desc = "Previous Comment",
		nowait = true,
		remap = false,
	},
	{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", nowait = true, remap = false },
	{ "<leader>f", group = "Telescope", nowait = true, remap = false },
	{
		"<leader>fC",
		"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
		desc = "Current Buffer Grep",
		nowait = true,
		remap = false,
	},
	{
		"<leader>fb",
		"<cmd>lua require('telescope.builtin').buffers()<cr>",
		desc = "Buffers",
		nowait = true,
		remap = false,
	},
	{ "<leader>fd", "<cmd>Telescope docker<cr>", desc = "Docker", nowait = true, remap = false },
	{
		"<leader>ff",
		"<cmd>lua require('telescope.builtin').find_files()<cr>",
		desc = "Find Files",
		nowait = true,
		remap = false,
	},
	{
		"<leader>fg",
		"<cmd>lua require('telescope.builtin').live_grep()<cr>",
		desc = "Grep",
		nowait = true,
		remap = false,
	},
	{
		"<leader>fh",
		"<cmd>lua require('telescope.builtin').help_tags()<cr>",
		desc = "Help Tags",
		nowait = true,
		remap = false,
	},
	{ "<leader>fn", "<cmd>Telescope notify<cr>", desc = "Notifications", nowait = true, remap = false },
	{ "<leader>fs", "<cmd>Telescope luasnip<cr>", desc = "Luasnip", nowait = true, remap = false },
	{ "<leader>g", group = "Git/Goto/Gitlab", nowait = true, remap = false },
	{
		"<leader>gA",
		"<cmd>lua require('gitlab').add_assignee()<cr>",
		desc = "Add Assignee",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gC",
		"<cmd>lua require('gitlab').create_multiline_comment()<cr>",
		desc = "Create MultilineComment",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gD",
		"<cmd>lua require('goto-preview').goto_preview_definition()<cr>",
		desc = "Definition",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gS",
		"<cmd>lua require('gitlab').create_comment_suggestion()<cr>",
		desc = "Create Suggestion",
		nowait = true,
		remap = false,
	},
	{ "<leader>ga", "<cmd>lua require('gitlab').approve()<cr>", desc = "Approve", nowait = true, remap = false },
	{
		"<leader>gar",
		"<cmd>lua require('gitlab').add_reviewer()<cr>",
		desc = "Add Reviewer",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gc",
		"<cmd>lua require('gitlab').create_comment()<cr>",
		desc = "Create Comment",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gd",
		"<cmd>lua require('gitlab').toggle_discussions()<cr>",
		desc = "Toggle Discussion",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gda",
		"<cmd>lua require('gitlab').delete_assignee()<cr>",
		desc = "Delete Assignee",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gdr",
		"<cmd>lua require('gitlab').delete_reviewer()<cr>",
		desc = "Delete Reviewer",
		nowait = true,
		remap = false,
	},
	{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazygit", nowait = true, remap = false },
	{ "<leader>gm", "<cmd>lua require('gitlab').merge()<cr>", desc = "Merge", nowait = true, remap = false },
	{
		"<leader>gmd",
		"<cmd>lua require('gitlab').move_to_discussion_tree_from_diagnostic()<cr>",
		desc = "Move to Discussion",
		nowait = true,
		remap = false,
	},
	{
		"<leader>go",
		"<cmd>lua require('gitlab').open_in_browser()<cr>",
		desc = "Open in Browser",
		nowait = true,
		remap = false,
	},
	{ "<leader>gp", "<cmd>lua require('gitlab').pipeline()<cr>", desc = "Pipeline", nowait = true, remap = false },
	{ "<leader>gr", "<cmd>lua require('gitlab').review()<cr>", desc = "Review", nowait = true, remap = false },
	{ "<leader>gs", "<cmd>lua require('gitlab').summary()<cr>", desc = "Gitlab Summary", nowait = true, remap = false },
	{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },
	{ "<leader>l", group = "Lazy/Latex", nowait = true, remap = false },
	{ "<leader>lL", "<cmd>Telescope texsuite labels<cr>", desc = "Tex labels", nowait = true, remap = false },
	{
		"<leader>lc",
		"<cmd>Telescope texsuite newcommands<cr>",
		desc = "Tex newcommaneds",
		nowait = true,
		remap = false,
	},
	{ "<leader>lf", "<cmd>Telescope texsuite frames<cr>", desc = "Tex Frames", nowait = true, remap = false },
	{ "<leader>lh", "<cmd>Telescope texsuite headings<cr>", desc = "Tex headings", nowait = true, remap = false },
	{ "<leader>ll", "<cmd>Lazy<cr>", desc = "Lazy", nowait = true, remap = false },
	{ "<leader>m", group = "Mail/Minimap", nowait = true, remap = false },
	{ "<leader>mD", "<cmd>HimalayaDelete<cr>", desc = "Delete Mail", nowait = true, remap = false },
	{ "<leader>mM", "<cmd>MinimapToggle<cr>", desc = "Minimap Toggle", nowait = true, remap = false },
	{ "<leader>mR", "<cmd>HimalayaReplyAll<cr>", desc = "Reply All", nowait = true, remap = false },
	{ "<leader>ma", "<cmd>HimalayaAttachments<cr>", desc = "Download Attachments", nowait = true, remap = false },
	{ "<leader>mc", "<cmd>HimalayaCopy<cr>", desc = "Copy Mail", nowait = true, remap = false },
	{ "<leader>mf", "<cmd>HimalayaForward<cr>", desc = "Forward", nowait = true, remap = false },
	{ "<leader>mg", "<cmd>HimalayaFolders<cr>", desc = "Folders", nowait = true, remap = false },
	{ "<leader>mm", "<cmd>HimalayaMove<cr>", desc = "Move Mail", nowait = true, remap = false },
	{ "<leader>mn", "<cmd>HimalayaNextPage<cr>", desc = "Next Page", nowait = true, remap = false },
	{ "<leader>mp", "<cmd>HimalayaPreviousPage<cr>", desc = "Previous Page", nowait = true, remap = false },
	{ "<leader>mr", "<cmd>HimalayaReply<cr>", desc = "Reply", nowait = true, remap = false },
	{ "<leader>mw", "<cmd>HimalayaWrite<cr>", desc = "Write Mail", nowait = true, remap = false },
	{ "<leader>q", "<cmd>q!<CR>", desc = "Quit", nowait = true, remap = false },
	{ "<leader>s", group = "Snippets", nowait = true, remap = false },
	{ "<leader>ss", "<cmd>Telescope luasnip<cr>", desc = "Search", nowait = true, remap = false },
	{ "<leader>t", group = "Terminal/tmux/translate", nowait = true, remap = false },
	{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", nowait = true, remap = false },
	{
		"<leader>th",
		"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
		desc = "Horizontal",
		nowait = true,
		remap = false,
	},
	{ "<leader>tr", "<cmd>Pantran<cr>", desc = "Translate", nowait = true, remap = false },
	{
		"<leader>trr",
		"<cmd>Pantran.motion_translate()<cr>",
		desc = "Translate Selected Text",
		nowait = true,
		remap = false,
	},
	{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", nowait = true, remap = false },
	{ "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
	{ "<leader>x", group = "Trouble", nowait = true, remap = false },
	{
		"<leader>xd",
		"<cmd>TroubleToggle document_diagnostics<cr>",
		desc = "Document Diagnostics",
		nowait = true,
		remap = false,
	},
	{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Loclist", nowait = true, remap = false },
	{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix", nowait = true, remap = false },
	{ "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", desc = "References", nowait = true, remap = false },
	{
		"<leader>xw",
		"<cmd>TroubleToggle workspace_diagnostics<cr>",
		desc = "Workspace Diagnostics",
		nowait = true,
		remap = false,
	},
	{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle", nowait = true, remap = false },
	{ "<leader>z", group = "Zen", nowait = true, remap = false },
	{ "<leader>zz", "<cmd>ZenMode<cr>", desc = "ZenMode", nowait = true, remap = false },
})

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
