---@type LazyPluginSpec
return {
  "kevinhwang91/nvim-fundo",
  event = {
    "BufReadPre",
  },
  dependencies = "kevinhwang91/promise-async",
  build = function()
    require("fundo").install()
  end,
  opts = {},
}
