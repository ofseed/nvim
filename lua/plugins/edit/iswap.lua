---@type LazyPluginSpec
return {
  "mizlan/iswap.nvim",
  opts = {
    flash_style = false,
    move_cursor = true,
  },
  keys = {
    { "<M-k>", "<Cmd>ISwapWithLeft<CR>", desc = "Swap with left" },
    { "<M-h>", "<Cmd>ISwapWithLeft<CR>", desc = "Swap with left" },
    { "<M-l>", "<Cmd>ISwapWithRight<CR>", desc = "Swap with right" },
    { "<M-j>", "<Cmd>ISwapWithRight<CR>", desc = "Swap with right" },
  },
}
