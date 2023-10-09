local cmp = require("cmp")

cmp.setup({
  sources = {
    {name = "nvim_lsp"},
    -- {name = "luasnip"},
    -- {name = "buffer"},
  },
  window = {
    completion = cmp.config.window.bordered(),
    -- completion = {
    --   winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    --   col_offset = -3,
    --   side_padding = 0,
    -- },
    documentation = cmp.config.window.bordered(),
  },
  completion = {
      completeopt = "menu,menuone,noinsert"
  },
  mapping = cmp.mapping.preset.insert({
    -- Enter key confirms completion item
    -- ["<CR>"] = cmp.mapping.confirm({select = false}),
    -- ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    -- ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    -- Ctrl + space triggers completion menu
    -- ["<C-Space>"] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
})
