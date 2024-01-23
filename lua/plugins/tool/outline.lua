local custom = require "custom"

---@type LazyPluginSpec
return {
  "hedyhli/outline.nvim",
  keys = {
    { "<leader>a", "<Cmd>Outline<CR>" },
  },
  opts = {
    preview_window = {
      border = custom.border,
      live = true,
    },
    symbols = {
      icon_source = "lspkind",
    },
  },
}
