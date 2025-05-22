---@type LazyPluginSpec
return {
  "williamboman/mason-lspconfig.nvim",
  event = {
    "Filetype",
  },
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",

    "b0o/SchemaStore.nvim",
    "nanotee/sqls.nvim",
  },
  opts = function()
    return {
      handlers = {
        function() end,
      },
    }
  end,
}
