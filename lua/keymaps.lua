local which_key = require "which-key"

which_key.register {
  ["s"] = { name = "+hop" },
  ["["] = { name = "+prev" },
  ["]"] = { name = "+next" },
  ["g"] = { name = "+goto" },
  ["<leader>"] = {
    name = "+<leader>",
    ["<leader>"] = { name = "+<localleader>" },
    ["f"] = {
      name = "+find",
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
      name = "+buffer",
      ["s"] = { name = "+sort" },
    },
    ["l"] = {
      name = "+lsp",
      ["w"] = { name = "+workspace" },
    },
    ["i"] = { name = "+insert" },
    ["m"] = { name = "+manage" },
    ["r"] = { name = "+tasks" },
    ["d"] = { name = "+debug" },
    ["t"] = { name = "+toggle" },
    ["o"] = { name = "+org" },
    ["h"] = { name = "+hop" },
  },
}

local function toggle_quickfix()
  local wins = vim.fn.getwininfo()
  local qf_win = vim
    .iter(wins)
    :filter(function(win)
      return win.quickfix == 1
    end)
    :totable()
  if #qf_win == 0 then
    vim.cmd.copen()
  else
    vim.cmd.cclose()
  end
end

vim.keymap.set("n", "<leader>tq", toggle_quickfix, { desc = "Quickfix" })
