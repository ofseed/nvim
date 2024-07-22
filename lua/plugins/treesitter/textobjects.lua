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
  keys = function()
    local repeatable = require "nvim-treesitter-textobjects.repeatable_move"
    local select = require "nvim-treesitter-textobjects.select"
    local move = require "nvim-treesitter-textobjects.move"

    return {
      ---
      --- Repeatable
      ---
      {
        ";",
        function()
          repeatable.repeat_last_move()
        end,
        mode = { "n", "x", "o" },
        desc = "Next last move",
      },
      {
        ",",
        function()
          repeatable.repeat_last_move_opposite()
        end,
        mode = { "n", "x", "o" },
        desc = "Prev last move",
      },
      {
        "f",
        function()
          return repeatable.builtin_f_expr()
        end,
        expr = true,
        mode = { "n", "x", "o" },
        desc = "Move to next char",
      },
      {
        "F",
        function()
          return repeatable.builtin_F_expr()
        end,
        expr = true,
        mode = { "n", "x", "o" },
        desc = "Move to prev char",
      },
      {
        "t",
        function()
          return repeatable.builtin_t_expr()
        end,
        expr = true,
        mode = { "n", "x", "o" },
        desc = "Move before next char",
      },
      {
        "T",
        function()
          return repeatable.builtin_T_expr()
        end,
        expr = true,
        mode = { "n", "x", "o" },
        desc = "Move before prev char",
      },
      --
      -- Select
      --
      {
        "aa",
        function()
          select.select_textobject "@parameter.outer"
        end,
        mode = { "x", "o" },
        desc = "a argument",
      },
      {
        "ia",
        function()
          select.select_textobject "@parameter.inner"
        end,
        mode = { "x", "o" },
        desc = "inner part of a argument",
      },
      {
        "af",
        function()
          select.select_textobject "@function.outer"
        end,
        mode = { "x", "o" },
        desc = "a function region",
      },
      {
        "if",
        function()
          select.select_textobject "@function.inner"
        end,
        mode = { "x", "o" },
        desc = "inner part of a function region",
      },
      {
        "ar",
        function()
          select.select_textobject "@return.outer"
        end,
        mode = { "x", "o" },
        desc = "a return",
      },
      {
        "ir",
        function()
          select.select_textobject "@return.outer"
        end,
        mode = { "x", "o" },
        desc = "inner return",
      },
      {
        "ac",
        function()
          select.select_textobject "@class.outer"
        end,
        mode = { "x", "o" },
        desc = "a of a class",
      },
      {
        "ic",
        function()
          select.select_textobject "@class.inner"
        end,
        mode = { "x", "o" },
        desc = "inner part of a class region",
      },
      {
        "aj",
        function()
          select.select_textobject "@conditional.outer"
        end,
        mode = { "x", "o" },
        desc = "a judge",
      },
      {
        "ij",
        function()
          select.select_textobject "@conditional.inner"
        end,
        mode = { "x", "o" },
        desc = "inner part of a judge region",
      },
      {
        "al",
        function()
          select.select_textobject "@loop.outer"
        end,
        mode = { "x", "o" },
        desc = "a loop",
      },
      {
        "il",
        function()
          select.select_textobject "@loop.inner"
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
          move.goto_next_start "@parameter.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Next argument start",
      },
      {
        "]A",
        function()
          move.goto_next_end "@parameter.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Next argument end",
      },
      {
        "[a",
        function()
          move.goto_previous_start "@parameter.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Previous argument start",
      },
      {
        "[A",
        function()
          move.goto_previous_end "@parameter.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Previous argument end",
      },
      {
        "]f",
        function()
          move.goto_next_start "@function.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Next function start",
      },
      {
        "]F",
        function()
          move.goto_next_end "@function.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Next function end",
      },
      {
        "[f",
        function()
          move.goto_previous_start "@function.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Previous function start",
      },
      {
        "[F",
        function()
          move.goto_previous_end "@function.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Previous function end",
      },
      {
        "]r",
        function()
          move.goto_next_start "@return.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Next return start",
      },
      {
        "]R",
        function()
          move.goto_next_end "@return.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Next return end",
      },
      {
        "[r",
        function()
          move.goto_previous_start "@return.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Previous return start",
      },
      {
        "[R",
        function()
          move.goto_previous_end "@return.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Previous return end",
      },
      {
        "]c",
        function()
          move.goto_next_start "@class.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Next class start",
      },
      {
        "]C",
        function()
          move.goto_next_end "@class.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Next class end",
      },
      {
        "[c",
        function()
          move.goto_previous_start "@class.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Previous class start",
      },
      {
        "[C",
        function()
          move.goto_previous_end "@class.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Previous class end",
      },
      {
        "]j",
        function()
          move.goto_next_start "@conditional.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Next judge start",
      },
      {
        "]J",
        function()
          move.goto_next_end "@conditional.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Next judge end",
      },
      {
        "[j",
        function()
          move.goto_previous_start "@conditional.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Previous judge start",
      },
      {
        "[J",
        function()
          move.goto_previous_end "@conditional.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Previous judge end",
      },
      {
        "]l",
        function()
          move.goto_next_start "@loop.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Next loop start",
      },
      {
        "]L",
        function()
          move.goto_next_end "@loop.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Next loop end",
      },
      {
        "[l",
        function()
          move.goto_previous_start "@loop.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Previous loop start",
      },
      {
        "[L",
        function()
          move.goto_previous_end "@loop.outer"
        end,
        mode = { "n", "x", "o" },
        desc = "Previous loop end",
      },
    }
  end,
}
