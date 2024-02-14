---@type LazyPluginSpec
return {
  "folke/neodev.nvim",
  lazy = true,
  opts = {
    library = {
      types = false,
      plugins = false,
    },
    lspconfig = false,
  },
}
