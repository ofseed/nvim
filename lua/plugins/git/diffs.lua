return {
  'barrettruth/diffs.nvim',
  init = function()
    vim.g.diffs = {
      integrations = {
        neogit = true,
        gitsigns = true,
      },
    }
  end,
}
