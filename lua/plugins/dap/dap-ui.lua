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
      desc = "Toggle UI",
    },
    {
      "<leader>dU",
      function()
        require("dapui").toggle { layout = 2 }
      end,
      desc = "Toggle UI",
    },
  },
}
