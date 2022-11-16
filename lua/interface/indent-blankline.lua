local ok, blankline = pcall(require, "indent_blankline")
if not ok then
  vim.notify "Could not load indent blankline"
end

blankline.setup {
  show_current_context = true,
  show_current_context_start = true,
  -- use_treesitter = true,
  -- use_treesitter_scope = true,
}
