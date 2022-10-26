local ok, ccc = pcall(require, "ccc")
if not ok then
  vim.notify "Could not load ccc"
  return
end

ccc.setup ()

