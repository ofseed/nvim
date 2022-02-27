local vim = vim
local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end
local ok, gps = pcall(require, "nvim-gps")
if not ok then
  return
end

local function shiftwidth()
  return "SW:" .. vim.o.shiftwidth
end

lualine.setup {
  sections = {
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
    },
    lualine_x = {
      "copilot",
      "filetype",
      shiftwidth,
      "encoding",
      "fileformat",
    },
  },
  options = {
    theme = vim.g.colors_name,
    disabled_filetypes = {
      "alpha",
      "aerial",
    },
    section_separators = "",
    component_separators = "│",
  },
  extensions = {
    "nvim-tree",
    "toggleterm",
    "symbols-outline",
  },
}
