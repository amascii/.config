-- bundle install rubocop
vim.keymap.set(
    "n",
    "<leader>f",
    "<cmd>!bundle exec rubocop -A %<CR>",
    { noremap = true }
)
