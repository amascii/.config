--[[
Neovim expects config files in `~/.config/nvim/`
If `.config` already exists, just add the `nvim` folder inside

General setting, remappings, and plugin management goes here
We use Packer to install plugins; check out the Quickstart
https://github.com/wbthomason/packer.nvim

:so this file to run Packer commands (PackerInstall, PackerSync, etc.)

Plugin settings go in `after/plugin/<plugin>.lua`
File-specific settings go in `after/ftplugin/<file-type>.lua`
--]]

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
vim.g.mapleader = " "
local map_opts = {noremap=true}
-- set(mode, lhs, rhs, opts)
vim.keymap.set("n", "<leader>l", "<cmd>Ex<CR>", map_opts)
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", map_opts)
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", map_opts)
vim.keymap.set("n", "<leader>bn", "<cmd>bn<CR>", map_opts)
vim.keymap.set("n", "<leader>bp", "<cmd>bp<CR>", map_opts)
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", map_opts)
vim.keymap.set("i", '"', '""<left>', map_opts)
vim.keymap.set("i", '(', '()<left>', map_opts)
vim.keymap.set("i", '{', '{}<left>', map_opts)
vim.keymap.set("i", '[', '[]<left>', map_opts)
-- Turn list of lines into snowflake
-- TODO Add copy command
vim.keymap.set("n", "<leader>sf", "<cmd>% norm A,<CR><cmd>% norm I'<CR><cmd>% norm f,i'<CR>Gf,x", map_opts)

-- PACKER
-- Only required if you have packer configured as `opt`
vim.cmd("packadd packer.nvim")

require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    use "tpope/vim-surround"
    -- use "ellisonleao/gruvbox.nvim"
    use "marko-cerovac/material.nvim"
    -- brew install ripgrep
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.3",
        -- or                            , branch = "0.1.x",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})

    -- LSP Support
    -- npm install -g pyright
    -- pip install pyright
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- Autocompletion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "saadparwaiz1/cmp_luasnip"

    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- use {
    --     "VonHeikemen/lsp-zero.nvim",
    --     requires = {
    --     }
    -- }

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    }
end)
