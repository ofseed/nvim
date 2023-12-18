local locals = require "locals"

return {
  "windwp/nvim-ts-autotag",
  cond = not locals.treesitter_dev,
  event = "InsertEnter",
  opts = {},
}
