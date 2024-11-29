local custom = require "custom"

---@type LazyPluginSpec
return {
  ---@module 'blink.cmp'
  "Saghen/blink.cmp",
  build = "cargo build --release",
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "enter" },
    sources = {
      completion = {
        enabled_providers = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "lazydev",
        },
      },
      providers = {
        lsp = {
          name = "LSP",
          fallback_for = {
            "lazydev",
          },
        },
        lazydev = {
          name = "Development",
          module = "lazydev.integrations.blink",
        },
      },
    },
    completion = {
      menu = {
        scrollbar = false,
        border = "rounded",
        -- Minimum width should be controlled by components
        min_width = 1,
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "provider" },
          },
          components = {
            provider = {
              text = function(ctx)
                return "[" .. ctx.item.source_name:sub(1, 3):upper() .. "]"
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        update_delay_ms = 0,
        window = {
          border = "rounded",
          winblend = vim.o.pumblend,
          scrollbar = false,
        },
      },
    },
    appearance = {
      nerd_font_variant = "mono",
      kind_icons = custom.icons.kind,
    },
  },
}
