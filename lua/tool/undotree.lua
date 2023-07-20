return {
  "mbbill/undotree",
  config = function()
    vim.g.undotree_HelpLine = 0
  end,
  keys = {
    { "<leader>u", "<Cmd>UndotreeToggle<CR>", desc = "Undo Tree" },
  },
}
