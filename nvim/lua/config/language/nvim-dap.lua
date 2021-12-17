local dap = require "dap"

dap.adapters.python = {
  type = "executable",
  command = "python",
  args = {
    "-m",
    "debugpy.adapter",
  },
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}", -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
        return cwd .. "/venv/bin/python"
      elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
      else
        return "/usr/bin/python"
      end
    end,
  },
}

vim.api.nvim_set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>b",
  ":lua require'dap'.toggle_breakpoint()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>B",
  ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>lp",
  ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", { noremap = true, silent = true })

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticInfo' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'Constant' })
vim.fn.sign_define('DapBreakpointRejected', { text = '' })
