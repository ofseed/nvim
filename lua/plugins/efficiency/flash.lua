return {
  "folke/flash.nvim",
  opts = {
    modes = {
      search = {
        highlight = {
          backdrop = true,
        },
      },
      char = {
        enabled = false,
      },
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
      mode = { "n" },
      function()
        require("flash").treesitter()
      end,
      desc = "Select Treesitter Node",
    },
    {
      "S",
      mode = { "n" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Search Treesitter Node",
    },
  },
}
