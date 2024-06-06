local locals = require "locals"

---@type LazyPluginSpec
return {
  "windwp/nvim-ts-autotag",
  ft = {
    "html",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "svelte",
  },
  cond = not locals.treesitter_dev,
  -- Cannot be lazy loaded
  opts = {},
}
