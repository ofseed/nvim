local custom = require "custom"

---@type LazyPluginSpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    registers = true,
    window = {
      border = custom.border,
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "<Plug>", "require" }, -- hide mapping boilerplate
  },
  config = function(_, opts)
    local which_key = require "which-key"
    which_key.setup(opts)

    which_key.register {
      ["s"] = { name = "+hop" },
      ["["] = { name = "+prev" },
      ["]"] = { name = "+next" },
      ["g"] = { name = "+goto" },
      ["<C-g>"] = { name = "+gpt" },
      ["<leader>"] = {
        name = "+<leader>",
        ["<leader>"] = { name = "+<localleader>" },
        ["f"] = {
          name = "+find",
          ["g"] = { name = "+git" },
          ["d"] = { name = "+debug" },
        },
        ["g"] = {
          name = "+git",
          ["d"] = { name = "+diffview" },
        },
        ["s"] = {
          name = "+session",
          ["c"] = { name = "+current" },
        },
        ["b"] = {
          name = custom.prefer_tabpage and "+tab" or "+buffer",
          ["s"] = { name = "+sort" },
        },
        ["l"] = {
          name = "+lsp/diagnostic",
          ["w"] = { name = "+workspace" },
        },
        ["i"] = { name = "+insert" },
        ["m"] = { name = "+manage" },
        ["r"] = { name = "+tasks" },
        ["d"] = { name = "+debug" },
        ["D"] = { name = "+debuggee" },
        ["t"] = { name = "+toggle" },
        ["T"] = { name = "+test" },
        ["o"] = { name = "+org" },
        ["h"] = { name = "+helper" },
        ["p"] = { name = "+programs" },
      },
    }
  end,
}
