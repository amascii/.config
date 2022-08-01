-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_transparent = true
-- vim.opt.background = "dark"
-- vim.g.seoul256_background = 234
vim.cmd("colorscheme gruvbox")

require("lualine").setup({
    options = {
        icons_enabled = false,
        theme = "ayu_mirage"
    }
})
