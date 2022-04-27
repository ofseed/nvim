local ok, python = pcall(require, "dap-python")
if not ok then
  vim.notify "Could not load dap python"
  return
end

python.setup "/usr/bin/python3"

vim.keymap.set("n", "<leader>dn", ":lua require('dap-python').test_method()<CR>")
vim.keymap.set("n", "<leader>df", ":lua require('dap-python').test_class()<CR>")
vim.keymap.set("v", "<leader>ds", "<ESC>:lua require('dap-python').debug_selection()<CR>")
