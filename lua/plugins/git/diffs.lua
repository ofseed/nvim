return {
  'barrettruth/diffs.nvim',
  lazy = true,
  init = function()
    vim.g.diffs = {
      integrations = {
        neogit = true,
        gitsigns = true,
      },
    }
  end,
}
