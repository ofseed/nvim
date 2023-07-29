local custom = require "custom"

return {
  "michaelb/sniprun",
  build = "bash install.sh",
  opts = {
    borders = custom.border,
  },
  keys = {
    { "<leader>r", "<Cmd>SnipRun<CR>", mode = { "n", "v" }, desc = "Run" },
  },
}
