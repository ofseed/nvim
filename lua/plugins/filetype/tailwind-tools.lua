local custom = require "custom"

---@type LazyPluginSpec
return {
  "luckasRanarison/tailwind-tools.nvim",
  ft = {
    "javascriptreact",
    "typescriptreact",
    "html",
    "markdown",
    "mdx",
  },
  opts = {
    conceal = {
      symbol = "…",
    },
  },
  config = function(_, opts)
    require("tailwind-tools").setup(opts)
    custom.cmp_format.before = require("tailwind-tools.cmp").lspkind_format
  end,
}
