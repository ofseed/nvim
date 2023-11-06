return {
  "simnalamburt/vim-mundo",
  enabled = vim.fn.has "python3" == 1,
  keys = {
    { "<leader>u", "<Cmd>MundoToggle<CR>", desc = "Undo Tree" },
  },
}
