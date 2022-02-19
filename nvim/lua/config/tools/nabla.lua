local vim = vim
local ok, nabla = pcall(require, "nabla")
if not ok then
  return
end

vim.api.nvim_set_keymap("n", "<leader>p", ":lua require'nabla'.popup()<CR>", { noremap = true })
