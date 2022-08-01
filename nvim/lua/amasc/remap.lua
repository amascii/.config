local nnoremap = require("amasc.keymap").nnoremap
local inoremap = require("amasc.keymap").inoremap

nnoremap("<leader>p", "<cmd>Vex<CR>")
inoremap('"', '""<left>')
inoremap("'", "''<left>")
inoremap("(", "()<left>")
inoremap("{", "{}<left>")
inoremap("[", "[]<left>")
