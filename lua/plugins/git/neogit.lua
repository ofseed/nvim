local custom = require "custom"

---@type LazyPluginSpec
return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  cmd = {
    "Neogit",
  },
  keys = {
    { "<leader>gg", "<Cmd>Neogit<CR>", desc = "Open Neogit" },
  },
  opts = {
    disable_insert_on_commit = "auto",
    disable_commit_confirmation = true,
    disable_builtin_notifications = true,
    graph_style = "unicode",
    kind = custom.prefer_tabpage and "tab" or "split",
    integrations = {
      diffview = true,
    },
    sections = {
      stashes = {
        folded = false,
      },
      recent = {
        folded = false,
      },
    },
  },
}
