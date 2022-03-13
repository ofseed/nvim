local ok, nvim_bqf = pcall(require, "bqf")
if not ok then
  vim.notify "Could not load bqf"
  return
end

nvim_bqf.setup {}
