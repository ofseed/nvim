local custom = require "custom"

return {
  "jackMort/ChatGPT.nvim",
  cond = vim.env.OPENAI_API_KEY ~= nil,
  cmd = {
    "ChatGPT",
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    chat = {
      sessions_window = {
        style = custom.border,
      },
    },
    popup_window = {
      border = {
        style = custom.border,
      },
    },
    system_window = {
      border = {
        style = custom.border,
      },
    },
    popup_input = {
      border = {
        style = custom.border,
      },
    },
    settings_window = {
      border = {
        style = custom.border,
      },
    },
  },
}
