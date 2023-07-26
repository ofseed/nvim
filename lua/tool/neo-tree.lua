local custom = require "custom"

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
  },
  opts = {
    popup_border_style = custom.border,
    source_selector = {
      winbar = true,
      sources = {
        {
          source = "filesystem",
          display_name = "  Files ",
        },
        {
          source = "buffers",
          display_name = "  Buffers ",
        },
        {
          source = "git_status",
          display_name = "  Git ",
        },
      },
    },
    window = {
      width = custom.width,
      mappings = {
        ["<Space>"] = "none",
      },
    },
    filesystem = {
      group_empty_dirs = true,
    },
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File Explorer" },
  },
}
