return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require "notify"
    notify.setup {
      render = "compact",
      stages = "static",
      top_down = false,
    }
    vim.notify = notify
  end,
}
