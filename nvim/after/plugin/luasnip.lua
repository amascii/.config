local ls = require "luasnip"
local types = require "luasnip.util.types"
require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "NonTest" } },
      },
    },
  },
}

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
-- vim.keymap.set("i", "<c-l>", function()
--   if ls.choice_active() then
--     ls.change_choice(1)
--   end
-- end)

-- shortcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")


-- Snippet creator
-- s(<trigger>, <nodes>)
local s = ls.s

-- Format node
local fmt = require("luasnip.extras.fmt").fmt

local i = ls.insert_node

-- Repeats a node
-- rep(<position>)
-- local rep = require("luasnip.extras").rep

ls.add_snippets("python" , {
        s("f", fmt("def {}({}):\n    {}", {i(1, "func"), i(2, "arg"), i(0, "pass")})),
        -- s("expand", fmt("This does not expand dong", {}))
    }
)
