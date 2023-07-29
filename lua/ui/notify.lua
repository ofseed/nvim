return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require "notify"
    notify.setup {
      render = "compact",
      stages = "static",
      timeout = 2500,
    }
    vim.notify = notify
  end,
}
