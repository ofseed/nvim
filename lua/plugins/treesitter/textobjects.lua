---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter" },
    { "ghostbuster91/nvim-next" },
  },
  opts = {
    select = {
      lookahead = true,
      include_surrounding_whitespace = true,
    },
    move = {
      set_jumps = true,
    },
  },
  keys = {
    --
    -- Select
    --
    {
      "aa",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject "@parameter.outer"
      end,
      mode = { "x", "o" },
      desc = "a argument",
    },
    {
      "ia",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject "@parameter.inner"
      end,
      mode = { "x", "o" },
      desc = "inner part of a argument",
    },
    {
      "af",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject "@function.outer"
      end,
      mode = { "x", "o" },
      desc = "a function region",
    },
    {
      "if",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject "@function.inner"
      end,
      mode = { "x", "o" },
      desc = "inner part of a function region",
    },
    {
      "ar",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject "@return.outer"
      end,
      mode = { "x", "o" },
      desc = "a return",
    },
    {
      "ir",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject "@return.outer"
      end,
      mode = { "x", "o" },
      desc = "inner return",
    },
    {
      "ac",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject "@class.outer"
      end,
      mode = { "x", "o" },
      desc = "a of a class",
    },
    {
      "ic",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject "@class.inner"
      end,
      mode = { "x", "o" },
      desc = "inner part of a class region",
    },
    {
      "aj",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject "@conditional.outer"
      end,
      mode = { "x", "o" },
      desc = "a judge",
    },
    {
      "ij",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject "@conditional.inner"
      end,
      mode = { "x", "o" },
      desc = "inner part of a judge region",
    },
    {
      "al",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject "@loop.outer"
      end,
      mode = { "x", "o" },
      desc = "a loop",
    },
    {
      "il",
      function()
        require("nvim-treesitter-textobjects.select").select_textobject "@loop.inner"
      end,
      mode = { "x", "o" },
      desc = "inner part of a loop",
    },
    --
    -- Move
    --
    {
      "]a",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_start "@parameter.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Next argument start",
    },
    {
      "]A",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_end "@parameter.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Next argument end",
    },
    {
      "[a",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_start "@parameter.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Previous argument start",
    },
    {
      "[A",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_end "@parameter.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Previous argument end",
    },
    {
      "]f",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_start "@function.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Next function start",
    },
    {
      "]F",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_end "@function.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Next function end",
    },
    {
      "[f",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_start "@function.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Previous function start",
    },
    {
      "[F",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_end "@function.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Previous function end",
    },
    {
      "]r",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_start "@return.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Next return start",
    },
    {
      "]R",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_end "@return.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Next return end",
    },
    {
      "[r",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_start "@return.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Previous return start",
    },
    {
      "[R",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_end "@return.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Previous return end",
    },
    {
      "]c",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_start "@class.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Next class start",
    },
    {
      "]C",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_end "@class.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Next class end",
    },
    {
      "[c",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_start "@class.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Previous class start",
    },
    {
      "[C",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_end "@class.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Previous class end",
    },
    {
      "]j",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_start "@conditional.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Next judge start",
    },
    {
      "]J",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_end "@conditional.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Next judge end",
    },
    {
      "[j",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_start "@conditional.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Previous judge start",
    },
    {
      "[J",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_end "@conditional.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Previous judge end",
    },
    {
      "]l",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_start "@loop.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Next loop start",
    },
    {
      "]L",
      function()
        require("nvim-treesitter-textobjects.move").goto_next_end "@loop.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Next loop end",
    },
    {
      "[l",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_start "@loop.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Previous loop start",
    },
    {
      "[L",
      function()
        require("nvim-treesitter-textobjects.move").goto_previous_end "@loop.outer"
      end,
      mode = { "n", "x", "o" },
      desc = "Previous loop end",
    },
  },
}
