local custom = require "custom"

---@type LazyPluginSpec
return {
  "nvim-tree/nvim-tree.lua",
  enabled = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view = {
      width = custom.width,
      float = {
        open_win_config = {
          border = custom.border,
        },
      },
    },
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" },
  },
}
