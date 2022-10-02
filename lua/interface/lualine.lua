local ok, lualine = pcall(require, "lualine")
if not ok then
  vim.notify "Could not load lualine"
  return
end

local ok, navic = pcall(require, "nvim-navic")
if not ok then
  vim.notify "Could not load navic"
end

local function indent()
  if vim.o.expandtab then
    return "SW:" .. vim.o.shiftwidth
  else
    return "TS:" .. vim.o.tabstop
  end
end

local function is_file()
  return vim.bo.buftype ~= "nofile"
end

lualine.setup {
  sections = {
    lualine_x = {
      "copilot",
      "filetype",
      indent,
      "encoding",
      "fileformat",
    },
  },
  winbar = {
    lualine_b = {
      { "filename", cond = is_file },
    },
    lualine_c = {
      { navic.get_location, cond = navic.is_available },
    },
  },
  inactive_winbar = {
    lualine_b = {
      { "filename", cond = is_file },
    },
  },
  options = {
    icons_enabled = true,
    theme = "auto",
    disabled_filetypes = {
      "alpha",
    },
    always_divide_middle = true,
    globalstatus = false,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  extensions = {
    "man",
    "nvim-tree",
    "neo-tree",
    "toggleterm",
    "symbols-outline",
    "aerial",
    "nvim-dap-ui",
  },
}
