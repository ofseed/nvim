local M = {}

-- Colorscheme
M.theme = "catppuccin"

-- Where a tab is a tabpage rather than a buffer
M.prefer_tabpage = true

-- Border style of floating windows
M.border = "rounded"

-- Width of side windows
M.width = function()
  local columns = vim.go.columns
  return math.floor(columns * 0.2) > 25 and math.floor(columns * 0.2) or 25
end

local append_space = function(icons)
  local result = {}
  for k, v in pairs(icons) do
    result[k] = v .. " "
  end
  return result
end

local kind_icons = {
  Array = "",
  Boolean = "",
  Class = "",
  Color = "",
  Constant = "",
  Constructor = "",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "",
  File = "",
  Folder = "",
  Function = "",
  Interface = "",
  Key = "",
  Keyword = "",
  Method = "",
  Module = "",
  Namespace = "",
  Null = "",
  Number = "",
  Object = "",
  Operator = "",
  Package = "",
  Property = "",
  Reference = "",
  Snippet = "",
  String = "",
  Struct = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Variable = "",
}

M.icons = {
  -- LSP diagnostic
  diagnostic = {
    error = "󰅚 ",
    warn = "󰀪 ",
    hint = "󰌶 ",
    info = "󰋽 ",
  },
  -- LSP kinds
  kind = kind_icons,
  kind_with_space = append_space(kind_icons),
}

return M
