local ok, color = pcall(require, "document-color")
if not ok then
  vim.notify "Could not load document-color"
  return
end

color.setup {
  -- Default options
  mode = "background", -- "background" | "foreground" | "single"
}
