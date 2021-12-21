local bullets = require "org-bullets"

bullets.setup {
  symbols = { "◉", "○", "✸", "✿" }
  -- or a function that receives the defaults and returns a list
  -- symbols = function(default_list)
  --   table.insert(default_list, "♥")
  --   return default_list
  -- end,
}
