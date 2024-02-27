local custom = require "custom"

return {
  "rcarriga/nvim-dap-ui",
  opts = {
    floating = {
      border = custom.border,
    },
    layouts = {
      {
        elements = {
          {
            id = "scopes",
            size = 0.25,
          },
          {
            id = "breakpoints",
            size = 0.25,
          },
          {
            id = "stacks",
            size = 0.25,
          },
          {
            id = "watches",
            size = 0.25,
          },
        },
        position = "left",
        size = 30,
      },
      {
        elements = {
          {
            id = "repl",
            size = 0.5,
          },
          {
            id = "console",
            size = 0.5,
          },
        },
        position = "bottom",
        size = 15,
      },
    },
  },
  keys = {
    {
      "<leader>du",
      function()
        require("dapui").toggle { layout = 1 }
      end,
      desc = "Toggle UI sidebar",
    },
    {
      "<leader>dU",
      function()
        require("dapui").toggle {}
      end,
      desc = "Toggle UI",
    },
    {
      "<leader>dc",
      function()
        require("dapui").toggle { layout = 2 }
      end,
      desc = "Toggle console",
    },
    {
      "<M-k>",
      function()
        require("dapui").eval()
      end,
      desc = "Evaluate expression",
      mode = { "n", "v" },
    },
  },
}
