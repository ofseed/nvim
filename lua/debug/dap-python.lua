local ok, dap = pcall(require, "dap-python")
if not ok then
  vim.notify "Could not load dap-python"
  return
end

dap.setup "/usr/bin/python3"

vim.keymap.set("n", "<leader>dn", require("dap-python").test_method, { desc = "Test method" })
vim.keymap.set("n", "<leader>df", require("dap-python").test_class, { desc = "Test class" })
vim.keymap.set("v", "<leader>ds", require("dap-python").debug_selection, { desc = "Debug selection" })
