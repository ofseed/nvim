local custom = require "custom"

---@type LazyPluginSpec
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      border = custom.border,
    },
    select = {
      backend = { "fzf_lua", "telescope", "fzf", "builtin", "nui" },
      builtin = {
        border = custom.border,
      },
      fzf_lua = {
        winopts = {
          height = 0.4,
        },
      },
    },
  },
}
