local nnoremap = require("amasc.keymap").nnoremap
local inoremap = require("amasc.keymap").inoremap


vim.g.mapleader = " "
nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>r", "<cmd>!python %<CR>")
inoremap('"', '""<left>')
inoremap("(", "()<left>")
inoremap("{", "{}<left>")
inoremap("[", "[]<left>")
