local ok, filetype = pcall(require, "filetype")
if not ok then
  vim.notify "Could not load filetype"
  return
end

filetype.setup {}
