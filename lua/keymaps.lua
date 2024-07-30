local utils = require "utils"

vim.keymap.set("", "j", "gj")
vim.keymap.set("", "k", "gk")
vim.keymap.set("", "gj", "j")
vim.keymap.set("", "gk", "k")
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")
vim.keymap.set("s", "<BS>", "<BS><Cmd>startinsert<CR>")
vim.keymap.set("s", "<C-h>", "<C-h><Cmd>startinsert<CR>")
vim.g.mapleader = " "
vim.g.maplocalleader = "  "

local next_diagnostic, prev_diagnostic = utils.make_repeatable_move_pair(
  function()
    vim.diagnostic.jump { count = vim.v.count1 }
  end,
  function()
    vim.diagnostic.jump { count = -vim.v.count1 }
  end
)
vim.keymap.set(
  "n",
  "]d",
  next_diagnostic,
  { desc = "Jump to the next diagnostic in the current buffer" }
)
vim.keymap.set(
  "n",
  "[d",
  prev_diagnostic,
  { desc = "Jump to the previous diagnostic in the current buffer" }
)

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

vim.keymap.set("n", "<leader>q", toggle_quickfix, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>tq", toggle_quickfix, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>hi", function()
  vim.show_pos()
end, { desc = "Inspect" })
vim.keymap.set("n", "<leader>ht", function()
  vim.treesitter.inspect_tree()
end, { desc = "Treesitter Tree" })
vim.keymap.set("n", "<leader>hq", function()
  vim.treesitter.query.edit()
end, { desc = "Treesitter Query" })

local cnext, cprevious = utils.make_repeatable_move_pair(function()
  return pcall(function()
    vim.cmd.cnext { count = vim.v.count1 }
  end)
end, function()
  return pcall(function()
    vim.cmd.cprevious { count = vim.v.count1 }
  end)
end)
vim.keymap.set("n", "]q", cnext, { desc = "Next quickfix" })
vim.keymap.set("n", "[q", cprevious, { desc = "Prev quickfix" })

local filetype_keymaps =
  vim.api.nvim_create_augroup("ofseed_filetype_keymaps", {})
vim.api.nvim_create_autocmd("Filetype", {
  group = filetype_keymaps,
  pattern = "qf",
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = bufnr })
  end,
})

vim.keymap.set(
  "n",
  "<leader>ll",
  vim.diagnostic.setloclist,
  { desc = "Diagnostic list" }
)
