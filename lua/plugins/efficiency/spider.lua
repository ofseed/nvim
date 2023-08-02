return {
  "chrisgrieser/nvim-spider",
  -- Disable because it conflicts with chinese characters
  enabled = false,
  event = "VeryLazy",
  opts = true,
  keys = {
    {
      "w",
      function()
        require("spider").motion "w"
      end,
      mode = { "n", "o", "x" },
      desc = "Spider-w",
    },
    {
      "e",
      function()
        require("spider").motion "e"
      end,
      mode = { "n", "o", "x" },
      desc = "Spider-e",
    },
    {
      "b",
      function()
        require("spider").motion "b"
      end,
      mode = { "n", "o", "x" },
      desc = "Spider-b",
    },
    {
      "ge",
      function()
        require("spider").motion "ge"
      end,
      mode = { "n", "o", "x" },
      desc = "Spider-ge",
    },
  },
}
