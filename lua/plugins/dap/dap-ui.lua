local custom = require "custom"

return {
  "rcarriga/nvim-dap-ui",
  opts = {
    floating = {
      border = custom.border,
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
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      desc = "Evaluate expression",
      mode = { "n", "v" },
    },
  },
}
