local custom = require 'custom'

---@type LazyPluginSpec
return {
  ---@module 'blink.cmp'
  'Saghen/blink.cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = { 'mayromr/blink-cmp-dap' },
  version = '*',
  -- build = "cargo build --release",
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',
    },
    sources = {
      default = {
        'lsp',
        'dap',
        'omni',
        'path',
        'snippets',
        'buffer',
        'lazydev',
      },
      providers = {
        lsp = {
          name = 'LSP',
          fallbacks = {
            'lazydev',
          },
        },
        lazydev = {
          name = 'Development',
          module = 'lazydev.integrations.blink',
        },
        dap = {
          name = 'dap',
          module = 'blink-cmp-dap',
        },
        omni = {
          enabled = function()
            return vim.bo.omnifunc ~= 'v:lua.vim.lsp.omnifunc'
              and vim.bo.omnifunc ~= 'v:lua.vim.lua_omnifunc'
              and vim.bo.omnifunc ~= "v:lua.require'dap.repl'.omnifunc"
          end,
        },
      },
    },
    completion = {
      list = {
        selection = {
          preselect = function(ctx)
            return ctx.mode ~= 'cmdline'
              and not require('blink.cmp').snippet_active { direction = 1 }
          end,
        },
      },
      menu = {
        border = 'rounded',
        -- Minimum width should be controlled by components
        min_width = 1,
        draw = {
          columns = {
            { 'kind_icon' },
            { 'label', 'label_description', gap = 1 },
            { 'provider' },
          },
          components = {
            provider = {
              text = function(ctx)
                return '[' .. ctx.item.source_name:sub(1, 3):upper() .. ']'
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        update_delay_ms = 50,
        window = {
          border = 'rounded',
          winblend = vim.o.pumblend,
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        show_documentation = true,
        border = 'rounded',
        winblend = vim.o.pumblend,
      },
    },
    appearance = {
      nerd_font_variant = 'mono',
      kind_icons = custom.icons.kind,
    },
  },
}
