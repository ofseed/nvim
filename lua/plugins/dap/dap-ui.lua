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
        require("dapui").toggle()
      end,
      desc = "Toggle UI",
    },
  },
}
