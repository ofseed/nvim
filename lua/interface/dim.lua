local ok, dim = pcall(require, "neodim")
if not ok then
  vim.notify "Could not load dim"
  return
end

vim.diagnostic.config {
  virtual_text = {
    prefix = "",
    format = function(diagnostic)
      return require("neodim").ignore_vtext(diagnostic)
    end,
  },
  signs = true,
  underline = false,
  update_in_insert = false,
}

dim.setup {}
