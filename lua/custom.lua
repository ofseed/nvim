local M = {}

-- Colorscheme
M.theme = 'catppuccin'

-- Width of side windows
M.width = function()
  return math.max(math.floor(vim.go.columns * 0.2), 30)
end

local append_space = function(icons)
  local result = {}
  for k, v in pairs(icons) do
    result[k] = v .. ' '
  end
  return result
end

local kind_icons = {
  Array = '',
  Boolean = '',
  Class = '',
  Color = '',
  Constant = '',
  Constructor = '',
  Enum = '',
  EnumMember = '',
  Event = '',
  Field = '',
  File = '',
  Folder = '',
  Function = '',
  Interface = '',
  Key = '',
  Keyword = '',
  Method = '',
  Module = '',
  Namespace = '',
  Null = '',
  Number = '',
  Object = '',
  Operator = '',
  Package = '',
  Property = '',
  Reference = '',
  Snippet = '',
  String = '',
  Struct = '',
  Text = '',
  TypeParameter = '',
  Unit = '',
  Value = '',
  Variable = '',
}

M.icons = {
  -- LSP diagnostic
  diagnostic = {
    error = '󰅚 ',
    warn = '󰀪 ',
    hint = '󰌶 ',
    info = '󰋽 ',
  },
  -- LSP kinds
  kind = kind_icons,
  kind_with_space = append_space(kind_icons),
}

return M
