local opts = {
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    brightness_up = "<C-Up>",
    brightness_down = "<C-Down>",
    toggle = "<Leader>s",
  },
}

return {
  "sunjon/Shade.nvim",
  -- Disable because conflict with other floating window plugins
  enabled = false,
  opts = opts,
}
