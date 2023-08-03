return {
  "L3MON4D3/LuaSnip",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  config = function()
    local snip = require "luasnip"
    local types = require "luasnip.util.types"

    local i = snip.insert_node
    local sn = snip.snippet_node

    snip.setup {
      update_events = { "TextChanged", "TextChangedI" },
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
      snip_env = {
        -- Same with text node, used for function nodes
        text_same_with = function(args)
          return args[1][1]
        end,

        -- Same with text node, used for dynamic nodes
        insert_same_with = function(args)
          return sn(nil, {
            i(1, args[1][1]),
          })
        end,

        -- Same with text node but append text, used for function nodes
        text_same_with_and_append = function(args, _, user_arg1)
          return args[1][1] .. user_arg1
        end,

        -- Same with text node but append text, used for dynamic nodes
        insert_same_with_and_append = function(args, _, _, user_arg1)
          return sn(nil, {
            i(1, args[1][1] .. user_arg1),
          })
        end,
      },
    }

    require("luasnip.loaders.from_lua").lazy_load {
      paths = vim.fn.stdpath "config" .. "/lua/snippets",
    }
  end,
}
