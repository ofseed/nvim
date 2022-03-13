local vim = vim
local ok, nabla = pcall(require, "nabla")
if not ok then
  vim.notify "Could not load nabla"
  return
end

vim.api.nvim_set_keymap("n", "<leader>p", ":lua require'nabla'.popup()<CR>", { noremap = true })
