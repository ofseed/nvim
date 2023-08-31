return {
  "folke/flash.nvim",
  opts = {
    modes = {
      treesitter = {
        highlight = {
          backdrop = true,
        },
      },
    },
  },
  event = "VeryLazy",
  keys = {
    {
      "s",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Select Treesitter Node",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Search Treesitter Node",
    },
  },
}
