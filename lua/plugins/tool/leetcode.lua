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
      ["question_enter"] = {
        -- For question
        function(q)
          local bufnr = q.bufnr

          vim.b[bufnr].copilot_enabled = false

          vim.keymap.set("n", "<localleader>l", "<Cmd>Leet list<CR>", { buffer = bufnr, desc = "LeetCode list" })
          vim.keymap.set("n", "<localleader>r", "<Cmd>Leet run<CR>", { buffer = bufnr, desc = "LeetCode run" })
          vim.keymap.set("n", "<localleader>s", "<Cmd>Leet submit<CR>", { buffer = bufnr, desc = "LeetCode submit" })
          vim.keymap.set("n", "<localleader>i", "<Cmd>Leet info<CR>", { buffer = bufnr, desc = "LeetCode information" })
          vim.keymap.set("n", "<localleader>d", "<Cmd>Leet desc<CR>", { buffer = bufnr, desc = "LeetCode description" })
        end,
        -- For question description
        function(q)
          local winid = q.description.winid

          vim.wo[winid].wrap = true
          vim.wo[winid].showbreak = "NONE"
          vim.wo[winid].smoothscroll = true
          vim.wo[winid].foldcolumn = "0"
        end,
      },
    },
    image_support = true,
  },
}
