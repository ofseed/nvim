local ok, colorizer = pcall(require, "colorizer")
if not ok then
  vim.notify "Could not load colorizer"
  return
end

colorizer.setup {}
