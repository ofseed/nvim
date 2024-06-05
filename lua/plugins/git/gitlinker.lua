---@type LazyPluginSpec
return {
  "ruifm/gitlinker.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {
    mappings = nil,
  },
  keys = {
    {
      "<leader>gy",
      function()
        require("gitlinker").get_buf_range_url "n"
      end,
      desc = "Create link",
    },
    {
      "<leader>gy",
      function()
        require("gitlinker").get_buf_range_url "v"
      end,
      mode = "v",
      desc = "Create link",
    },
  },
}
