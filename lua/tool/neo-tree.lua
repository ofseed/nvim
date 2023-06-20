local ok, tree = pcall(require, "neo-tree")
if not ok then
  vim.notify "Could not load tree"
  return
end

local custom = require "custom"

tree.setup {
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
  default_component_configs = {
    container = {
      enable_character_fade = false,
    },
    git_status = {
      symbols = {
        added = "",
        modified = "",
        deleted = "",
        renamed = "",
        untracked = "",
        ignored = "",
        unstaged = "",
        staged = "",
        conflict = "",
      },
    },
  },
  window = {
    width = custom.width,
    mappings = {
      ["<space>"] = "none",
    },
  },
}

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "File Explorer" })
