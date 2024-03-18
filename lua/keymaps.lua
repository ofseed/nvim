vim.g.mapleader = " "
vim.g.maplocalleader = "  "
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

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

-- Provided by nvim-next
-- vim.keymap.set("n", "[q", "<Cmd>cprevious<CR>", {})
-- vim.keymap.set("n", "]q", "<Cmd>cnext<CR>", {})

local filetype_keymaps = vim.api.nvim_create_augroup("ofseed_filetype_keymaps", {})
vim.api.nvim_create_autocmd("Filetype", {
  group = filetype_keymaps,
  pattern = "qf",
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = bufnr })
  end,
})

-- Provided by nvim-next
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostic" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostic" })
vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, { desc = "Diagnostic list" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Diagnostic float" })
