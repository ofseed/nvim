---@type LazyPluginSpec
return {
  "ldelossa/gh.nvim",
  enabled = false,
  dependencies = {
    {
      "ldelossa/litee.nvim",
      config = function()
        require("litee.lib").setup()
      end,
    },
  },
  config = function()
    require("litee.gh").setup()
  end,
}
