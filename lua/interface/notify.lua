local opts = {
  background_colour = "Normal",
  fps = 30,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "static",
  timeout = 2500,
  top_down = true,
}

return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require "notify"
    notify.setup(opts)
    vim.notify = notify
  end,
}
