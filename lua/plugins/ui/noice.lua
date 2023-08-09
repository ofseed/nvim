local custom = require "custom"

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.cmdheight = 0
  end,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  opts = {
    cmdline = {
      format = {
        search_down = {
          view = "cmdline",
        },
        search_up = {
          view = "cmdline",
        },
      },
    },
    lsp = {
      progress = {
        enabled = false,
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      signature = {
        enabled = false,
      },
      message = {
        enabled = false,
      },
    },
    views = {
      cmdline_popup = {
        border = {
          style = custom.border,
        },
      },
      hover = {
        border = {
          style = custom.border,
          padding = { 0, custom.border == "none" and 2 or 0 },
        },
        position = {
          row = custom.border == "none" and 1 or 2,
        },
      },
    },
  },
}
