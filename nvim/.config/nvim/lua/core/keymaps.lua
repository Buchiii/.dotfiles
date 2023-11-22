-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Leaving Files
vim.api.nvim_set_keymap("n", "<leader>q", ":q!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "<leader>w", ":w!<enter>", {noremap=false})

-- Lazygit
vim.keymap.set('n', '<leader>gg', "<cmd>LazyGit<cr>", {})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- nvim-tree
vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<enter>", {})
