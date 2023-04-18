local ok, horizon = pcall(require, "horizon")

horizon.setup {
  cmp = true,
  indent_blankline = true,
  nvim_tree = true,
  telescope = true,
  which_key = true,
  barbar = true,
  notify = true,
  symbols_outline = true,
  neo_tree = true,
  gitsigns = true,
  crates = true,
  hop = true,
  navic = true,
  quickscope = true,
}
