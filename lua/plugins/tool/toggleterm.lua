local custom = require "custom"

return {
  "akinsho/nvim-toggleterm.lua",
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<c-\>]],
    shell = vim.uv.os_uname().sysname == "Windows" and "pwsh" or "fish",
    float_opts = {
      border = custom.border,
    },
    winbar = {
      enabled = true,
    },
  },
  keys = {
    { "<C-\\>" },
    { "<Esc>", "<C-\\><C-N>", mode = "t" },
    { "<leader>tt", "<Cmd>ToggleTermToggleAll<CR>", mode = "n", desc = "All Terminal" },
    {
      "<leader>gl",
      function()
        require("toggleterm.terminal").Terminal
          :new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
          })
          :toggle()
      end,
      desc = "LazyGit",
    },
  },
}
