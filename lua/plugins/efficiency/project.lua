---@type LazyPluginSpec
return {
  "ofseed/project.nvim", -- maintained fork
  event = "VeryLazy",
  main = "project_nvim",
  opts = {
    ignore_lsp = { "jsonls", "yamlls", "taplo" },
  },
}
