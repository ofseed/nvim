return {
  "L3MON4D3/LuaSnip",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  config = function()
    local snip = require "luasnip"
    local types = require "luasnip.util.types"

    snip.setup {
      update_events = {"TextChanged", "TextChangedI"},
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { "●", "Keyword" } },
            virt_text_pos = "inline",
          },
          unvisited = {
            virt_text = { { "●", "Comment" } },
            virt_text_pos = "inline",
          },
        },
        [types.insertNode] = {
          active = {
            virt_text = { { "●", "Keyword" } },
            virt_text_pos = "inline",
          },
          unvisited = {
            virt_text = { { "●", "Comment" } },
            virt_text_pos = "inline",
          },
        },
      },
    }

    require("luasnip.loaders.from_lua").lazy_load {
      paths = vim.fn.stdpath "config" .. "/lua/snippets",
    }
  end,
}
