-- brew install stylua
vim.keymap.set(
    "n",
    "<leader>f",
    "<cmd>!stylua --indent-type Spaces  --indent-width 4 --column-width 88 %<CR>",
    { noremap = true }
)
