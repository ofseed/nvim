return {
  "danymat/neogen",
  opts = {
    snippet_engine = "luasnip",
  },
  keys = {
    {
      "<leader>ia",
      function()
        require("neogen").generate()
      end,
      desc = "Annotations",
    },
  },
}
