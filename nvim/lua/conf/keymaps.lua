local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Navigation
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<C-o>", opts)
-- keymap("i", "fd", "<Esc>", opts)

-- Copy/Paste
keymap("n", "<Leader>yy", '"+yy', opts)
keymap("v", "<Leader>yy", '"+y', opts)
keymap("n", "<Leader>yp", '"+p', opts)

-- Switch to recent visited buffer
keymap("n", "<Leader>;", ":b#<CR>", opts)

-- Explorer
keymap("n", "tt", ":NvimTreeToggle<CR>", opts)

-- Motion
keymap("", "<Home>", "H", opts)
keymap("", "<End>", "L", opts)
keymap("", "H", "^", opts)
keymap("", "L", "$", opts)


-- Start interactive EasyAlign in visual mode (e.g. vipga)
vim.cmd "xmap ga <Plug>(EasyAlign)"
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.cmd "nmap ga <Plug>(EasyAlign)"
