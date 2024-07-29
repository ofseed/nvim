local custom = require "custom"

---@type LazyPluginSpec
return {
  ---@module "scissors"
  "chrisgrieser/nvim-scissors",
  ---@type pluginConfig
  opts = {
    editSnippetPopup = {
      border = custom.border,
    },
    backdrop = {
      blend = 60,
    },
    jsonFormatter = "jq",
  },
  keys = {
    {
      "<leader>in",
      function()
        require("scissors").addNewSnippet()
      end,
      mode = { "n", "x" },
      desc = "New snippet",
    },
    {
      "<leader>ie",
      function()
        require("scissors").editSnippet()
      end,
      desc = "Edit snippet",
    },
  },
}
