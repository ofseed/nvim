---@type LazyPluginSpec
return {
  "L3MON4D3/LuaSnip",
  enabled = false,
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  keys = {
    {
      "<C-l>",
      function()
        require("luasnip").expand()
      end,
      mode = "i",
    },
    {
      "<Tab>",
      mode = "x",
    },
  },
  opts = function()
    local types = require "luasnip.util.types"

    return {
      store_selection_keys = "<Tab>",
      update_events = { "TextChanged", "TextChangedI" },
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { "●", "Operator" } },
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
  config = function(_, opts)
    require("luasnip").setup(opts)
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = "./snippets",
    }
  end,
}
