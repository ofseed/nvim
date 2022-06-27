local ok, dim = pcall(require, "neodim")
if not ok then
  vim.notify "Could not load dim"
  return
end

dim.setup {
  alpha = 0.75,
  blend_color = "#000000",
  update_in_insert = {
    enable = true,
    delay = 100,
  },
  hide = {
    virtual_text = true,
    signs = true,
    underline = true,
  },
}
