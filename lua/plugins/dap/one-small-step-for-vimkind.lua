---@type LazyPluginSpec
return {
  "jbyuki/one-small-step-for-vimkind",
  keys = {
    {
      "<leader>Dr",
      function()
        require("osv").launch { port = 8086 }
      end,
      desc = "Run",
    },
    {
      "<leader>Ds",
      function()
        require("osv").stop()
      end,
      desc = "Stop",
    },
  },
}
