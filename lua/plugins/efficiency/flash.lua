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
      desc = "Flash Treesitter",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
  },
}
