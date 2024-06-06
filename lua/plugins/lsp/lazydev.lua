---@type LazyPluginSpec
return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      {
        path = "luvit-meta/library",
        words = { "vim%.uv" },
      },
      {
        path = "lazy.nvim",
        words = { "LazyPluginSpec" },
      },
    },
  },
}
