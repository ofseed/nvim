return {
  "numToStr/Comment.nvim",
  init = function()
    vim.keymap.del("n", "gcc")
  end,
  keys = {
    { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
    { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
  },
  opts = {
    pre_hook = function(...)
      return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()(...)
    end,
  },
}
