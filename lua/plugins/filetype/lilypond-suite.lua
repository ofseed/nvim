local custom = require "custom"

---@type LazyPluginSpec
return {
  "martineausimon/nvim-lilypond-suite",
  ft = { "lilypond" },
  opts = {
    options = {
      border_style = custom.border,
    },
  },
}
