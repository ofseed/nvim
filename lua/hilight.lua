vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "GitSignsChangeLn", { link = "DiffText" })
    vim.api.nvim_set_hl(0, "GitSignsAddInline", { link = "GitSignsAddLn" })
    vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { link = "GitSignsDeleteLn" })
    vim.api.nvim_set_hl(0, "GitSignsChangeInline", { link = "GitSignsChangeLn" })
    vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "DiffDelete" })
  end,
})
