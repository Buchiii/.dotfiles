-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<A-,>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-.>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-1>", ":lua require'bufferline'.move_to(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-2>", ":lua require'bufferline'.move_to(2)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-3>", ":lua require'bufferline'.move_to(3)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-4>", ":lua require'bufferline'.move_to(4)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-5>", ":lua require'bufferline'.move_to(5)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-6>", ":lua require'bufferline'.move_to(6)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-7>", ":lua require'bufferline'.move_to(7)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-8>", ":lua require'bufferline'.move_to(8)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-9>", ":lua require'bufferline'.move_to(9)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-c>", ":bd<CR>", { noremap = true, silent = true })
