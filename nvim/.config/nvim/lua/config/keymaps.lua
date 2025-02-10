-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<A-,>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<A-.>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<A-c>", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
