return {
  "L3MON4D3/LuaSnip",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  config = function()
    local snip = require "luasnip"
    local types = require "luasnip.util.types"

    snip.config.setup {
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
  end,
}
