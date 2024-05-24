---@type LazyPluginSpec
return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    render = "minimal",
    stages = "static",
    top_down = false,
  },
}
