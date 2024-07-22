-- brew install stylua
vim.keymap.set("n", "<leader>f", "<cmd>!stylua --indent-type Spaces %<CR>", { noremap = true })
