local opts = {
  handlers = {
    python = function(config) end,
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "Constant" })
vim.fn.sign_define("DapBreakpointRejected", { text = "" })

return {
  "jay-babu/mason-nvim-dap.nvim",
  event = "VeryLazy",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  after = "mason.nvim",
  opts = opts,
  keys = {
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      { desc = "Debug: Continue" },
    },
    {
      "<F10>",
      function()
        require("dap").step_over()
      end,
      { desc = "Debug: Step over" },
    },
    {
      "<F11>",
      function()
        require("dap").step_into()
      end,
      { desc = "Debug: Step into" },
    },
    {
      "<F12>",
      function()
        require("dap").step_out()
      end,
      { desc = "Debug: Step out" },
    },
    {
      "<F9>",
      function()
        require("dap").toggle_breakpoint()
      end,
      { desc = "Debug: Toggle breakpoint" },
    },

    {
      "<leader>db",
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      { desc = "Set breakpoint" },
    },
    {
      "<leader>lp",
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
      end,
      { desc = "Set log point" },
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      { desc = "Toggle REPL" },
    },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
      { desc = "Run last" },
    },
  },
}
