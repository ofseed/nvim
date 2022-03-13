local ok, luasnip = pcall(require, "luasnip")
if not ok then
  vim.notify "Could not load luasnip"
  return
end

require("luasnip").config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

require("luasnip/loaders/from_vscode").lazy_load()
