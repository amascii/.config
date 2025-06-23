local opts = { noremap = true }
vim.keymap.set("n", "<leader>r", "<cmd>!python %<CR>", opts)
-- Install black via pipx or brew or pip
vim.keymap.set("n", "<leader>f", "<cmd>!black %<CR>", opts)
