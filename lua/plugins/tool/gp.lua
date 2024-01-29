local custom = require "custom"

---@type LazyPluginSpec
return {
  "https://github.com/Robitx/gp.nvim",
  cond = vim.env.OPENAI_API_KEY ~= nil,
  event = "VeryLazy",
  opts = {
    toggle_target = "split",
    style_chat_finder_border = custom.border,
    style_popup_border = custom.border,
  },
}
