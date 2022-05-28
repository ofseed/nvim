local ok, dap = pcall(require, "dap-python")
if not ok then
  vim.notify "Could not load dap-python"
  return
end

dap.setup "/usr/bin/python3"

vim.keymap.set("n", "<leader>dn", function()
  require("dap-python").test_method()
end)
vim.keymap.set("n", "<leader>df", function()
  require("dap-python").test_class()
end)
vim.keymap.set("v", "<leader>ds", function()
  require("dap-python").debug_selection()
end)
