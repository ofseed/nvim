local custom = require 'custom'

---@type LazyPluginSpec
return {
  'Bekaboo/dropbar.nvim',
  event = {
    'BufRead',
    'BufNewFile',
  },
  opts = {
    bar = {
      update_events = {
        buf = {
          'BufModifiedSet',
          'FileChangedShellPost',
          'TextChanged',
          'ModeChanged',
          'TextChangedT',
        },
      },
    },
    icons = {
      kinds = {
        symbols = vim.tbl_extend('keep', { Folder = ' ' }, custom.icons.kind_with_space),
      },
    },
    sources = {
      path = {
        modified = function(sym)
          return sym:merge {
            name = sym.name .. ' [+]',
            name_hl = 'DiffAdded',
          }
        end,
      },
      terminal = {
        name = function(buf)
          return vim.b[buf].term_title or vim.fn.bufname(buf)
        end,
      },
    },
  },
}
