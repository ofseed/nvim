local ok, preview = pcall(require, "fold-preview")
if not ok then
  vim.notify "Could not load fold-preview"
  return
end

preview.setup {
  default_keybindings = true,
  border = "rounded",
}
