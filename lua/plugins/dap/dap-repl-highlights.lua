local locals = require "locals"

---@type LazyPluginSpec
return {
  "LiadOz/nvim-dap-repl-highlights",
  -- Only loads when nvim-dap is loaded
  cond = not locals.treesitter_dev,
  lazy = true,
  opts = {},
}
