local ok, bullets = pcall(require, "org-bullets")
if not ok then
  vim.notify "Could not load org bullets"
  return
end

bullets.setup {
  symbols = { "◉", "○", "✸", "✿" },
  -- or a function that receives the defaults and returns a list
  -- symbols = function(default_list)
  --   table.insert(default_list, "♥")
  --   return default_list
  -- end,
}
