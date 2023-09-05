return {
  "Wansmer/treesj",
  keys = {
    {
      "gJ",
      function()
        require("treesj").join()
      end,
      desc = "Join lines"
    },
    {
      "gS",
      function()
        require("treesj").split()
      end,
      desc = "Split lines"
    },
  },
  opts = {
    use_default_keymaps = false,
  },
}
