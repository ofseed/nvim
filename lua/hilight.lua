vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd [[
hi link GitSignsChangeLn DiffText
hi link GitSignsAddInline GitSignsAddLn
hi link GitSignsDeleteInline GitSignsDeleteLn
hi link GitSignsChangeInline GitSignsChangeLn
hi link GitSignsDeleteLn DiffDelete
]]
  end,
})
