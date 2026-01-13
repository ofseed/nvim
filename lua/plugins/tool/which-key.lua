local custom = require 'custom'

---@type LazyPluginSpec
return {
  ---@module "which-key"
  'folke/which-key.nvim',
  event = 'VeryLazy',
  ---@type wk.Opts
  opts = {
    preset = 'modern',
    win = {
      no_overlap = false,
      border = custom.border,
    },
    icons = {
      breadcrumb = '',
      separator = '',
      ---@type wk.IconRule[]
      rules = {
        -- Verbs
        { pattern = 'insert', icon = ' ', color = 'cyan' },
        { pattern = 'create', icon = ' ', color = 'purple' },
        { pattern = 'new', icon = ' ', color = 'purple' },
        { pattern = 'run', icon = ' ', color = 'green' },
        { pattern = 'launch', icon = ' ', color = 'green' },
        { pattern = 'close', icon = ' ', color = 'red' },
        { pattern = 'stop', icon = ' ', color = 'red' },
        { pattern = 'reset', icon = ' ', color = 'grey' },
        { pattern = 'restore', icon = ' ', color = 'grey' },
        { pattern = 'reload', icon = ' ', color = 'grey' },
        { pattern = 'open', icon = ' ', color = 'green' },
        { pattern = 'delete', icon = ' ', color = 'blue' },
        { pattern = 'top', icon = ' ', color = 'grey' },
        { pattern = 'up', icon = ' ', color = 'grey' },
        { pattern = 'bottom', icon = ' ', color = 'grey' },
        { pattern = 'down', icon = ' ', color = 'grey' },
        { pattern = 'left', icon = ' ', color = 'grey' },
        { pattern = 'right', icon = ' ', color = 'grey' },
        { pattern = 'switch', icon = ' ', color = 'grey' },
        { pattern = 'move', icon = ' ', color = 'grey' },
        -- Nouns
        { pattern = 'fold', icon = ' ', color = 'azure' },
        { pattern = 'color', icon = ' ', color = 'red' },
        { pattern = 'highlight', icon = ' ', color = 'red' },
        { pattern = 'tree', icon = ' ', color = 'green' },
        { pattern = 'mark', icon = ' ', color = 'yellow' },
        { pattern = 'task', icon = ' ', color = 'green' },
        { pattern = 'help', icon = ' ', color = 'cyan' },
        { pattern = 'info', icon = ' ', color = 'cyan' },
        { pattern = 'blame', icon = ' ', color = 'cyan' },
        { pattern = 'program', icon = ' ', color = 'azure' },
        { pattern = 'plugin', icon = ' ', color = 'azure' },
        { pattern = 'package', icon = ' ', color = 'yellow' },
        { pattern = 'lsp', icon = ' ', color = 'red' },
        { pattern = 'test', icon = ' ', color = 'yellow' },
        { pattern = 'manage', icon = ' ', color = 'orange' },
        { pattern = 'outline', icon = ' ', color = 'purple' },
        { pattern = 'symbol', icon = ' ', color = 'orange' },
        { pattern = 'annotation', icon = ' ', color = 'grey' },
        { pattern = 'comment', icon = ' ', color = 'grey' },
        { pattern = 'term', icon = ' ', color = 'cyan' },
        { pattern = 'grep', icon = ' ', color = 'orange' },
        { pattern = 'quickfix', icon = ' ', color = 'yellow' },
        { pattern = 'list', icon = ' ', color = 'yellow' },
        { pattern = 'workspace', icon = ' ', color = 'yellow' },
        { pattern = 'regex', icon = ' ', color = 'yellow' },
        -- Override default
        { plugin = 'nvim-spectre', icon = ' ', color = 'blue' },
        { pattern = 'file', icon = ' ', color = 'cyan' },
        { pattern = 'debug', icon = ' ', color = 'red' },
        { pattern = 'find', icon = ' ', color = 'green' },
        { pattern = 'search', icon = ' ', color = 'green' },
        { pattern = 'session', icon = ' ', color = 'azure' },
        { pattern = 'format', icon = ' ', color = 'cyan' },
        { pattern = 'tab', icon = ' ', color = 'purple' },
        { pattern = 'buffer', icon = ' ', color = 'purple' },
        { pattern = 'window', icon = ' ', color = 'purple' },
      },
    },

    spec = {
      { '<leader>i', group = 'insert' },
      { '<leader>m', group = 'manage' },
      { '<leader>r', group = 'tasks' },
      { '<leader>d', group = 'debug' },
      { '<leader>t', group = 'toggle' },
      { '<leader>T', group = 'test' },
      { '<leader>o', group = 'org' },

      { '<leader>p', group = 'programs' },

      { '<leader>f', group = 'find' },
      { '<leader>fg', group = 'git' },
      { '<leader>fd', group = 'debug' },

      { '<leader>g', group = 'git' },
      { '<leader>gd', group = 'diffview' },

      { '<leader>s', group = 'session' },
      { '<leader>sc', group = 'current' },

      { '<leader>b', group = 'tab' },
      { '<leader>bs', group = 'sort' },
      { '<leader>l', group = 'lsp' },
      { '<leader>lw', group = 'workspace' },

      { '<leader>h', group = 'helper' },
      { '<leader>hp', group = 'profile' },
    },
  },
}
