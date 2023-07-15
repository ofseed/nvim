local ok, flash = pcall(require, "flash")
if not ok then
  vim.notify "Could not load flash"
  return
end

flash.setup {}
