local custom = require "custom"

---@type LazyPluginSpec
return {
  "NeogitOrg/neogit",
  branch = "nightly",
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
    disable_hint = true,
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
