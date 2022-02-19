local ok, nvim_bqf = pcall(require, "bqf")
if not ok then
  return
end

nvim_bqf.setup {}
