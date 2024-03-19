---@type LazyPluginSpec
return {
  "jbyuki/nabla.nvim",
  ft = { "tex", "markdown" },
  keys = {
    {
      "<localleader>p",
      function()
        require("nabla").toggle_virt()
      end,
    },
  },
}
