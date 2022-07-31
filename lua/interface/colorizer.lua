local ok, colorizer = pcall(require, "colorizer")
if not ok then
  vim.notify "Could not load colorizer"
  return
end

colorizer.setup({
  "html",
  "css",
  "javascript",
  "vue",
}, {
  RGB = true, -- #RGB hex codes
  RRGGBB = true, -- #RRGGBB hex codes
  names = true, -- "Name" codes like Blue
  RRGGBBAA = true, -- #RRGGBBAA hex codes
  rgb_fn = true, -- CSS rgb() and rgba() functions
  hsl_fn = true, -- CSS hsl() and hsla() functions
  css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  -- Available modes: foreground, background
  mode = "background", -- Set the display mode
})
