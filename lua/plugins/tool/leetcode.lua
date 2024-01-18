local arg = "leetcode"

return {
  "kawre/leetcode.nvim",
  lazy = vim.fn.argv()[1] ~= arg,
  opts = {
    arg = arg,
    cn = {
      enabled = true,
    },
    injector = {
      ["cpp"] = {
        before = { "#include <bits/stdc++.h>", "using namespace std;" },
      },
    },
    description = {
      position = "top",
    },
    console = {
      dir = "col",
    },
    hooks = {
      LeetQuestionNew = {
        -- For question
        function(q)
          local bufnr = q.bufnr;

          vim.keymap.set("n", "<localleader>r", "<Cmd>Leet run<CR>", { buffer = bufnr, desc = "LeetCode run" })
          vim.keymap.set("n", "<localleader>s", "<Cmd>Leet submit<CR>", { buffer = bufnr, desc = "LeetCode submit" })
          vim.keymap.set(
            "n",
            "<localleader>i",
            "<Cmd>Leet info<CR>",
            { buffer = bufnr, desc = "LeetCode information" }
          )
          vim.keymap.set(
            "n",
            "<localleader>d",
            "<Cmd>Leet desc<CR>",
            { buffer = bufnr, desc = "LeetCode description" }
          )
        end,
      },
    },
    image_support = true,
  },
}
