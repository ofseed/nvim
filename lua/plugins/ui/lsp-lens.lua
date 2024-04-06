---@type LazyPluginSpec
return {
  "VidocqH/lsp-lens.nvim",
  event = "LspAttach",
  -- Bad performance
  enabled = false,
  config = function()
    require("lsp-lens").setup {}
    vim.api.nvim_set_hl(0, "LspLens", { link = "LspCodeLens" })
  end,
}
