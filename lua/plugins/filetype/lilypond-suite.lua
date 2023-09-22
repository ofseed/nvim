local custom = require "custom"

return {
  "martineausimon/nvim-lilypond-suite",
  ft = { "lilypond" },
  opts = {
    options = {
      border_style = custom.border,
    },
  },
}
