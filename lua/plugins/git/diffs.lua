---@type LazyPluginSpec
return {
  'barrettruth/diffs.nvim',
  url = 'https://forge.barrettruth.com/barrettruth/diffs.nvim',
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
