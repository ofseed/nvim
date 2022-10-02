local ok, surround = pcall(require, "nvim-surround")
if not ok then
  vim.notify "Could not load nvim-surround"
  return
end

surround.setup {}
