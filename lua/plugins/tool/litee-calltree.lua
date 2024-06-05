---@type LazyPluginSpec
return {
  "ldelossa/litee-calltree.nvim",
  event = { "LspAttach" },
  dependencies = { "ldelossa/litee.nvim" },
  main = "litee.calltree",
  opts = {},
}
