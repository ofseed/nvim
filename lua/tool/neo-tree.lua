local ok, tree = pcall(require, "neo-tree")
if not ok then
  vim.notify "Could not load tree"
  return
end

local custom = require "custom"

tree.setup {}

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "File Explorer" })
