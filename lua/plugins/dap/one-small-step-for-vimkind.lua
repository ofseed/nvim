---@type LazyPluginSpec
return {
  "jbyuki/one-small-step-for-vimkind",
  keys = {
    {
      "<leader>Dl",
      function()
        require("osv").launch { port = 8086 }
      end,
      desc = "Launch",
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
