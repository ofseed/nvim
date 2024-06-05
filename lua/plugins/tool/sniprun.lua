local custom = require "custom"

---@type LazyPluginSpec
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
