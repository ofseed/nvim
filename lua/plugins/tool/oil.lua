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
    cleanup_delay_ms = false,
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
      ["gx"] = function()
        local cwd = require("oil").get_current_dir()
        local entry = require("oil").get_cursor_entry()
        vim.ui.open(vim.fs.joinpath(cwd, entry.name))
        vim.print(vim.fs.joinpath(cwd, entry.name))
      end,
    },
  },
}
