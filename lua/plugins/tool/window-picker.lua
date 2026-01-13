---@type LazyPluginSpec
return {
  's1n7ax/nvim-window-picker',
  version = '*',
  opts = {
    show_prompt = false,
    filter_func = function(window_ids)
      return vim.tbl_filter(function(window_id)
        if window_id == vim.api.nvim_get_current_win() then
          return false
        end

        if vim.api.nvim_win_get_config(window_id).relative ~= '' then
          return false
        end

        return true
      end, window_ids)
    end,
  },
  keys = {
    {
      '<C-W>w',
      function()
        local window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(window_id)
      end,
      desc = 'Pick a window',
    },
    {
      '<C-W><C-W>',
      function()
        local window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(window_id)
      end,
      desc = 'Pick a window',
    },
  },
}
