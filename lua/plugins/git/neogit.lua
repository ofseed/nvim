---@type LazyPluginSpec
return {
  'NeogitOrg/neogit',
  dependencies = {
    'sindrets/diffview.nvim',
    'barrettruth/diffs.nvim',
  },
  cmd = {
    'Neogit',
  },
  keys = {
    { '<leader>gg', '<Cmd>Neogit<CR>', desc = 'Open Neogit' },
  },
  opts = {
    disable_hint = true,
    graph_style = 'kitty',
    integrations = {
      diffview = true,
    },
    sections = {
      stashes = {
        folded = false,
      },
      recent = {
        folded = false,
      },
    },
  },
}
