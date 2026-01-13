---@type LazyPluginSpec
return {
  'epwalsh/obsidian.nvim',
  event = {
    'BufReadPre ' .. vim.fn.expand '~/Documents/Obsidian/*.md',
    'BufNewFile ' .. vim.fn.expand '~/Documents/Obsidian/*.md',
  },
  opts = {
    workspaces = {
      {
        name = 'Obsidian',
        path = '~/Documents/Obsidian',
      },
    },
    picker = {
      name = 'fzf-lua',
    },
  },
}
