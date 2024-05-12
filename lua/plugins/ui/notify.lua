return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require "notify"
    notify.setup {
      render = "minimal",
      stages = "static",
      top_down = false,
    }
  end,
}
