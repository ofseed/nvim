local custom = require "custom"

return {
  "stevearc/oil.nvim",
  lazy = false,
  keys = {
    {
      "-",
      function()
        require("oil").open()
      end,
      desc = "Open parent directory",
    },
  },
  opts = {
    skip_confirm_for_simple_edits = true,
    float = {
      border = custom.border,
    },
    preview = {
      border = custom.border,
    },
    progress = {
      border = custom.border,
    },
    keymaps = {
      ["<C-s>"] = "actions.select_split",
      ["<C-v>"] = "actions.select_vsplit",
    },
  },
}
