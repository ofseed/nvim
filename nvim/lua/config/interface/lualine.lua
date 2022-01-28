local vim = vim
local lualine = require "lualine"
local gps = require "nvim-gps"

lualine.setup {
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
    },
  },
  options = {
    theme = vim.g.colors_name,
    disabled_filetypes = {
      "alpha",
    },
    -- section_separators = "",
    -- component_separators = "│",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  extensions = {
    "nvim-tree",
    "toggleterm",
    "symbols-outline",
  },
}
