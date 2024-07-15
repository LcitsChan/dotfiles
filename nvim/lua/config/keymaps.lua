-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
--
-- Basic
map({ "n", "v" }, "<leader><cr>", ":nohl<cr>", { desc = "which_key_ignore" })
map({ "n", "v", "o" }, "H", "^")
map({ "n", "v", "o" }, "L", "$")

-- Redo
map({ "n", "v" }, "U", "<C-r>")

-- Save
map("n", "<leader>z", ":w<cr>", { desc = "which_key_ignore" })

-- Quit
vim.keymap.del("n", "<leader>qq")
map("n", "<leader>q", "<cmd>q<cr>", { desc = "which_key_ignore" })
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "which_key_ignore" })

-- Navigation
map("n", "<leader>;", "<cmd>b#<cr>", { desc = "which_key_ignore" })

-- Split
map("n", "<leader>-", "<C-W>s", { desc = "which_key_ignore", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "which_key_ignore", remap = true })

map({ "n", "v" }, "tt", "<cmd>Neotree<cr>")

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "which_key_ignore" })

-- lazy
vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>L")
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "which_key_ignore" })

-- dial
map("n", "<C-a>", "gg<>G")

-- LazyVim Changelog
map("n", "<leader>C", function()
  LazyVim.news.changelog()
end, { desc = "which_key_ignore" })
