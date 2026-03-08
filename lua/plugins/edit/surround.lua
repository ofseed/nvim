---@type LazyPluginSpec
return {
  'kylechui/nvim-surround',
  event = 'VeryLazy',
  keys = function()
    return {
      {
        '<C-g>s',
        '<Plug>(nvim-surround-insert)',
        mode = 'i',
        desc = 'Add a surrounding pair around the cursor (insert mode)',
      },
      {
        '<C-g>S',
        '<Plug>(nvim-surround-insert-line)',
        mode = 'i',
        desc = 'Add a surrounding pair around the cursor, on new lines (insert mode)',
      },
      {
        'ys',
        '<Plug>(nvim-surround-normal)',
        desc = 'Add a surrounding pair around a motion (normal mode)',
      },
      {
        'yss',
        '<Plug>(nvim-surround-normal-cur)',
        desc = 'Add a surrounding pair around the current line (normal mode)',
      },
      {
        'yS',
        '<Plug>(nvim-surround-normal-line)',
        desc = 'Add a surrounding pair around a motion, on new lines (normal mode)',
      },
      {
        'ySS',
        '<Plug>(nvim-surround-normal-cur-line)',
        desc = 'Add a surrounding pair around the current line, on new lines (normal mode)',
      },
      {
        'S',
        '<Plug>(nvim-surround-visual)',
        mode = 'x',
        desc = 'Add a surrounding pair around a visual selection',
      },
      {
        'gS',
        '<Plug>(nvim-surround-visual-line)',
        mode = 'x',
        desc = 'Add a surrounding pair around a visual selection, on new lines',
      },
      {
        'ds',
        '<Plug>(nvim-surround-delete)',
        desc = 'Delete a surrounding pair',
      },
      {
        'cs',
        '<Plug>(nvim-surround-change)',
        desc = 'Change a surrounding pair',
      },
      {
        'cS',
        '<Plug>(nvim-surround-change-line)',
        desc = 'Change a surrounding pair, putting replacements on new lines',
      },
    }
  end,
}
