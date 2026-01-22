local custom = require 'custom'

---@type LazyPluginSpec
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.cmdheight = 0

    -- Make sure to load noice when notify is called
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.notify = function(...)
      require('noice').notify(...)
    end
  end,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
  opts = {
    routes = {
      {
        filter = { event = 'msg_show', min_height = 20 },
        view = 'cmdline_output',
      },
    },
    cmdline = {
      format = {
        search_down = {
          view = 'cmdline',
        },
        search_up = {
          view = 'cmdline',
        },
        substitute = {
          pattern = {
            '^:%s*%%s?n?o?m?/',
            "^:'<,'>%s*s?n?m?/",
            '^:%d+,%d+%s*s?n?m?/',
          },
          icon = ' /',
          view = 'cmdline',
          lang = 'regex',
        },
      },
    },
    markdown = {
      hover = {
        ['%[.-%]%((%S-)%)'] = function(...)
          vim.ui.open(...)
        end,
      },
    },
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
      progress = {
        enabled = false,
      },
      message = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
    },
    views = {
      hover = {
        size = {
          max_width = 80,
        },
      },
    },
  },
  keys = {
    {
      '<leader>fn',
      '<Cmd>Noice fzf<CR>',
      desc = 'Noitification',
    },
    {
      '<C-F>',
      function()
        if not require('noice.lsp').scroll(4) then
          return '<c-f>'
        end
      end,
      mode = { 'n', 'i', 's' },
      silent = true,
      expr = true,
    },
    {
      '<C-B>',
      function()
        if not require('noice.lsp').scroll(-4) then
          return '<c-b>'
        end
      end,
      mode = { 'n', 'i', 's' },
      silent = true,
      expr = true,
    },
  },
}
