return {
  "ldelossa/litee-calltree.nvim",
  enabled = false,
  event = { "LspAttach" },
  dependencies = {
    "ldelossa/litee.nvim",
    main = "litee.lib",
    opts = {},
  },
  main = "litee.calltree",
  opts = {},
}
