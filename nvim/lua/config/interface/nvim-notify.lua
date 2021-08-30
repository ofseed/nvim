local vim = vim
local notify = require'notify'

notify.setup({
  -- Animation style (see below for details)
  stages = "fade",

  -- Default timeout for notifications
  timeout = 5000,

  -- For stages that change opacity this is treated as the highlight behind the window
  background_colour = "Normal",

  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})

vim.notify = notify
