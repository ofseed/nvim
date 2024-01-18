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
    image_support = true,
  },
}
