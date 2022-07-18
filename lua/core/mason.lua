local ok, mason = pcall(require, "mason")
if not ok then
  vim.notify "Could not load mason"
end

mason.setup {
  ui = {
    border = "rounded",
  },
}
