local ok, nabla = pcall(require, "nabla")
if not ok then
  vim.notify "Could not load nabla"
  return
end

vim.keymap.set("n", "<leader>p", ":lua require'nabla'.popup()<CR>")
