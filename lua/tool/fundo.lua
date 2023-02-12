local ok, fundo = pcall(require, "fundo")
if not ok then
  vim.notify "Could not load fundo"
  return
end

fundo.setup()
