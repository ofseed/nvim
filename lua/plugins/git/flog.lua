---@type LazyPluginSpec
return {
  "rbong/vim-flog",
  init = function()
    vim.g.flog_enable_extended_chars = 1
  end,
  dependencies = {
    "tpope/vim-fugitive",
  },
  cmd = "Flog",
}
