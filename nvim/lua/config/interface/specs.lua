local specs = require "specs"

specs.setup {
  show_jumps = true,
  min_jump = 30,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 12, -- time increments used for fade/resize effects
    blend = 30, -- starting blend, between 0-100 (fully transparent), see :h winblend
    width = 25,
    winhl = "Visual",
    fader = require("specs").exp_fader,
    resizer = require("specs").shrink_resizer,
  },
  ignore_filetypes = {},
  ignore_buftypes = {
    nofile = true,
  },
}
