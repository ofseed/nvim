local ok, dap = pcall(require, "dap")
if not ok then
  vim.notify "Could not load dap"
  return
end

dap.adapters.codelldb = {
  type = "server",
  port = "${port}", -- 💀 Use the port printed out or specified with `--port`
  executable = {
    command = vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/adapter/codelldb",
    args = { "--port", "${port}" },
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = "${fileDirname}/${fileBasenameNoExtension}",
    cwd = "${workspaceFolder}",
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "Constant" })
vim.fn.sign_define("DapBreakpointRejected", { text = "" })

vim.keymap.set("n", "<F5>", require("dap").continue, { desc = "Debug: Continue" })
vim.keymap.set("n", "<F10>", require("dap").step_over, { desc = "Debug: Step over" })
vim.keymap.set("n", "<F11>", require("dap").step_into, { desc = "Debug: Step into" })
vim.keymap.set("n", "<F12>", require("dap").step_out, { desc = "Debug: Step out" })
vim.keymap.set("n", "<F9>", require("dap").toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })

vim.keymap.set("n", "<leader>db", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Set breakpoint" })
vim.keymap.set("n", "<leader>lp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "Set log point" })
vim.keymap.set("n", "<leader>dr", require("dap").repl.toggle, { desc = "Toggle REPL" })
vim.keymap.set("n", "<leader>dl", require("dap").run_last, { desc = "Run last" })
