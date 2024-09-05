local custom = require "custom"

---@type LazyPluginSpec
return {
  "https://github.com/Robitx/gp.nvim",
  opts = {
    providers = {
      openai = {
        endpoint = "https://models.inference.ai.azure.com/chat/completions",
        secret = vim.env.GITHUB_TOKEN,
      },
    },
    toggle_target = "split",
    style_chat_finder_border = custom.border,
    style_popup_border = custom.border,
  },
  cmd = {
    -- Chat
    "GpChatNew",
    "GpChatToggle",
    "GpChatFinder",
  },
  keys = {
    -- Chat
    {
      "<C-g>c",
      "<Cmd>GpChatNew split<CR>",
      mode = { "n", "i" },
      desc = "New Chat",
    },
    {
      "<C-g>c",
      ":<C-u>'<,'>GpChatNew split<CR>",
      mode = { "v" },
      desc = "New Chat",
    },
    {
      "<C-g>t",
      "<Cmd>GpChatToggle split<CR>",
      mode = { "n", "i" },
      desc = "Toggle Chat",
    },
    {
      "<C-g>t",
      ":<C-u>'<,'>GpChatToggle split<CR>",
      mode = { "v" },
      desc = "Toggle Chat",
    },
    {
      "<C-g>f",
      "<Cmd>GpChatFinder<CR>",
      mode = { "n", "i" },
      desc = "Find Chat",
    },
    {
      "<C-g>p",
      ":<C-u>'<,'>GpChatPaste<CR>",
      mode = { "v" },
      desc = "Chat Paste",
    },
  },
}
