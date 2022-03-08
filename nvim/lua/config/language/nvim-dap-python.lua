local ok, python = pcall(require, "dap-python")
if not ok then
  vim.notify "Could not load dap python"
  return
end

python.setup "/usr/bin/python3"

vim.api.nvim_set_keymap(
  "n",
  "<leader>dn",
  ":lua require('dap-python').test_method()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>df",
  ":lua require('dap-python').test_class()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>ds",
  "<ESC>:lua require('dap-python').debug_selection()<CR>",
  { noremap = true, silent = true }
)
