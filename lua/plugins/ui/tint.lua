return {
  "levouh/tint.nvim",
  event = "VeryLazy",
  config = function()
    require("tint").setup {
      tint = -60,
      highlight_ignore_patterns = {
        "WinSeparator",
        "EndOfBuffer",
        "LineNr",
        "IndentBlanklineChar",
      },
      window_ignore_function = function(win)
        local buf = vim.api.nvim_win_get_buf(win)
        local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
        return buftype ~= "" and buftype ~= "acwrite"
      end,
    }

    vim.api.nvim_create_autocmd("ColorScheme", {
      desc = "Refresh tint",
      callback = function()
        -- Timeout is needed for wait all colorscheme highlights applied
        vim.defer_fn(function()
          require("tint").refresh()
        end, 100)
      end,
    })
  end,
}
