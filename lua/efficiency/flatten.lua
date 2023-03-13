local ok, flatten = pcall(require, "flatten")
if not ok then
  vim.notify "Could not load flatten"
end

flatten.setup {}
