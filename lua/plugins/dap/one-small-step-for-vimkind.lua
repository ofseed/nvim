---@type LazyPluginSpec
return {
  "jbyuki/one-small-step-for-vimkind",
  keys = {
    {
      "<leader>hd",
      function()
        require("osv").launch { port = 8086 }
      end,
      desc = "Launch as debuggee",
    },
  },
}
