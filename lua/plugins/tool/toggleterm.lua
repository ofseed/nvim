local custom = require "custom"

return {
  "akinsho/toggleterm.nvim",
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
  keys = function()
    local float_opts = {
      border = custom.border,
    }

    local lazygit = require("toggleterm.terminal").Terminal:new {
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = float_opts,
    }
    local lazydocker = require("toggleterm.terminal").Terminal:new {
      cmd = "lazydocker",
      hidden = true,
      direction = "float",
      float_opts = float_opts,
    }
    local gh_dash = require("toggleterm.terminal").Terminal:new {
      -- https://github.com/dlvhdr/gh-dash/issues/316
      env = { LANG = "en_US.UTF-8" },
      cmd = "gh-dash",
      hidden = true,
      direction = "float",
      float_opts = float_opts,
    }

    return {
      { "<C-\\>" },
      { "<Esc>", "<C-\\><C-N>", mode = "t" },
      { "<leader>tt", "<Cmd>ToggleTermToggleAll<CR>", mode = "n", desc = "All Terminal" },

      -- External programs
      {
        "<leader>gl",
        function()
          lazygit:toggle()
        end,
        desc = "LazyGit",
      },
      {
        "<leader>pd",
        function()
          lazydocker:toggle()
        end,
        desc = "Lazy Docker",
      },
      {
        "<leader>pg",
        function()
          gh_dash:toggle()
        end,
        desc = "GitHub Dash",
      },
    }
  end,
}
