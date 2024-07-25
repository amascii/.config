--[[
Neovim expects config files in `~/.config/nvim/`
If `.config` already exists, just add the `nvim` folder inside

General setting, remappings, and plugin management goes here

Plugin settings go in `after/plugin/<plugin>.lua`
File-specific settings go in `after/ftplugin/<file-type>.lua`
--]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

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
local map_opts = { noremap = true }
-- set(mode, lhs, rhs, opts)
vim.keymap.set("n", "<leader>l", "<cmd>Ex<CR>", map_opts)
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", map_opts)
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", map_opts)
vim.keymap.set("n", "<leader>}", "<cmd>bn<CR>", map_opts)
vim.keymap.set("n", "<leader>{", "<cmd>bp<CR>", map_opts)
vim.keymap.set("n", "<leader>fd", "<cmd>bd<CR>", map_opts)
vim.keymap.set("v", "<leader>y", '"+y', map_opts)
-- vim.keymap.set("i", '"', '""<left>', map_opts)
-- vim.keymap.set("i", "(", "()<left>", map_opts)
-- vim.keymap.set("i", "{", "{}<left>", map_opts)
-- vim.keymap.set("i", "[", "[]<left>", map_opts)
-- Turn list of lines into snowflake
vim.keymap.set("n", "<leader>sf", "<cmd>% norm A,<CR><cmd>% norm I'<CR><cmd>% norm f,i'<CR>Gf,x", map_opts)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { "echasnovski/mini.surround", version = false },
        { "echasnovski/mini.pairs", version = false },
        { "nvim-treesitter/nvim-treesitter" },
        -- brew install ripgrep
        { "nvim-telescope/telescope.nvim" },
        { "marko-cerovac/material.nvim" },
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },
        { "saadparwaiz1/cmp_luasnip" },
        { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
        { "nvim-lualine/lualine.nvim" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = false },
})

-- Setup plugins
require("mini.surround").setup({
    mappings = {
        -- add = "sa"
        -- delete = "sd"
        find = "",
        find_left = "",
        highlight = "",
        -- replace = "sr"
        update_n_lines = "",
        suffix_last = "",
        suffix_next = "",
    },
})
require("mini.pairs").setup()
require("lualine").setup()

-- COLOR BG
vim.g.material_style = "darker"
vim.cmd.colorscheme("material")

local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", telescope_builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
