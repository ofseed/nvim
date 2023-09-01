local group = vim.api.nvim_create_augroup("ofseed", {})

vim.api.nvim_create_autocmd({
  "FocusGained",
  "BufEnter",
  "CursorHold",
}, {
  group = group,
  desc = "Reload buffer on focus",
  callback = function()
    vim.cmd.checktime()
  end,
})
