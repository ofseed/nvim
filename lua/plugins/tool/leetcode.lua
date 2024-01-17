local arg = "leetcode"

return {
  "kawre/leetcode.nvim",
  lazy = vim.fn.argv()[1] ~= arg,
  opts = {
    arg = arg,
    cn = {
      enabled = true,
    },
    image_support = true,
  },
}
