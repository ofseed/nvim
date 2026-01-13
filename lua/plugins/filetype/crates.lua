---@type LazyPluginSpec
return {
  'Saecki/crates.nvim',
  event = { 'BufRead Cargo.toml' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
}
