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
    shell = vim.uv.os_uname().sysname == "Windows_NT" and "pwsh" or "fish",
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

    -- External programs
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
    {
      "<leader>pd",
      function()
        require("toggleterm.terminal").Terminal
          :new({
            cmd = "lazydocker",
            hidden = true,
            direction = "float",
          })
          :toggle()
      end,
      desc = "Lazy Docker",
    },
    {
      "<leader>pg",
      function()
        require("toggleterm.terminal").Terminal
          :new({
            -- https://github.com/dlvhdr/gh-dash/issues/316
            env = { LANG = "en_US.UTF-8" },
            cmd = "gh-dash",
            hidden = true,
            direction = "float",
          })
          :toggle()
      end,
      desc = "GitHub Dash",
    },
  },
}
