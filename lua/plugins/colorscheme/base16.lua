---@type LazyPluginSpec
return {
  "RRethy/nvim-base16",
  lazy = true,
  opts = {},
  confg = function(_, opts)
    require("base16-colorscheme").with_config(opts)
  end,
}
