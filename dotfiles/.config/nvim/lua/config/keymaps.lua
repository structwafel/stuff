-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- select all with ctrl-a
map("n", "<C-a>", "<esc>gg0VG<CR>")

-- paste from register instead of system
map("n", "s", '"0p')

-- f2 rename
map("n", "<leader>rn", ":IncRename ")
