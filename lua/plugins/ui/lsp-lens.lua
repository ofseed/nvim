---@type LazyPluginSpec
return {
  "VidocqH/lsp-lens.nvim",
  event = "LspAttach",
  -- Bad performance
  enabled = false,
  opts = {},
  config = function(_, opts)
    require("lsp-lens").setup(opts)
    vim.api.nvim_set_hl(0, "LspLens", { link = "LspCodeLens" })
  end,
}
