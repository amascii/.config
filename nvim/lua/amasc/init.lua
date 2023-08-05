-- SETS GO HERE
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.pyindent_open_paren = "shiftwidth()"
vim.g.pyindent_nested_paren = "shiftwidth()"
vim.g.pyindent_continue = "shiftwidth()"

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.foldmethod = "indent"
vim.opt.foldenable = false

-- vim.opt.smartindent = true

-- vim.opt.wrap = false

vim.opt.cursorcolumn = true
vim.opt.cursorline = true

-- vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
-- vim.g.netrw_browse_split = 4
-- vim.g.netrw_winsize = 25
-- vim.g.netrw_localrmdir = "rmd"

-- REMAPPINGS GO HERE
local nnoremap = require("amasc.keymap").nnoremap
local inoremap = require("amasc.keymap").inoremap


vim.g.mapleader = " "
nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>r", "<cmd>!python %<CR>")
inoremap('"', '""<left>')
inoremap("(", "()<left>")
inoremap("{", "{}<left>")
inoremap("[", "[]<left>")

-- PACKER
-- Only required if you have packer configured as `opt`
vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    use "tpope/vim-surround"
    use "ellisonleao/gruvbox.nvim"
    -- brew install ripgrep
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        -- or                            , branch = "0.1.x",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use { "marko-cerovac/material.nvim"}
    use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            -- npm install -g pyright
            -- pip install pyright
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-nvim-lua"},

            -- Snippets
            {"L3MON4D3/LuaSnip"},
            {"rafamadriz/friendly-snippets"},
        }
    }
end)
