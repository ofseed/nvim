---@type LazyPluginSpec
return {
  'mizlan/iswap.nvim',
  opts = {
    flash_style = false,
    move_cursor = true,
  },
  keys = {
    { '<M-k>', '<Cmd>ISwapNodeWithLeft<CR>', desc = 'Swap with left' },
    { '<M-h>', '<Cmd>ISwapNodeWithLeft<CR>', desc = 'Swap with left' },
    { '<M-l>', '<Cmd>ISwapNodeWithRight<CR>', desc = 'Swap with right' },
    { '<M-j>', '<Cmd>ISwapNodeWithRight<CR>', desc = 'Swap with right' },
  },
}
