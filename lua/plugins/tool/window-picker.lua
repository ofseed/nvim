return {
  "s1n7ax/nvim-window-picker",
  version = "*",
  opts = {
    show_prompt = false,
  },
  keys = {
    {
      "<C-W>w",
      function()
        local window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(window_id)
      end,
      desc = "Pick a window",
    },
    {
      "<C-W><C-W>",
      function()
        local window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(window_id)
      end,
      desc = "Pick a window",
    },
  },
}
