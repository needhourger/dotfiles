vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}
-- aident
map('v','<','<gv',opt)
map('v','>','>gv',opt)
-- Split screen
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt) -- close others
-- window jump
map("n", "< -h>", "<C-w>h", opt)
map("n", "< -j>", "<C-w>j", opt)
map("n", "< -k>", "<C-w>k", opt)
map("n", "< -l>", "<C-w>l", opt)
