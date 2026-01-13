---@type LazyPluginSpec
return {
  'folke/flash.nvim',
  opts = {
    search = {
      exclude = {
        'blink-cmp-menu',

        -- Default
        'notify',
        'cmp_menu',
        'noice',
        'flash_prompt',
        function(win)
          -- exclude non-focusable windows
          return not vim.api.nvim_win_get_config(win).focusable
        end,
      },
    },
    modes = {
      search = {
        enabled = true,
        highlight = {
          backdrop = true,
        },
      },
      char = {
        enabled = false,
      },
      treesitter = {
        highlight = {
          backdrop = true,
        },
      },
    },
  },
  event = 'VeryLazy',
  keys = {
    {
      's',
      mode = { 'n' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Select Treesitter Node',
    },
    {
      'S',
      mode = { 'n' },
      function()
        require('flash').treesitter_search()
      end,
      desc = 'Search Treesitter Node',
    },
  },
}
