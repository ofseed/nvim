---@type LazyPluginSpec
return {
  'Saecki/crates.nvim',
  event = { 'BufRead Cargo.toml' },
  opts = {},
}
