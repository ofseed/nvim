local M = {}

-- Border style of floating windows
M.border = "rounded"

-- Width of side windows
M.width = function()
  local columns = vim.go.columns
  return math.floor(columns * 0.2) > 25 and math.floor(columns * 0.2) or 25
end

M.icons = {
  -- LSP diagnostic
  diagnostic = {
    error = " ",
    warn = " ",
    hint = " ",
    info = " ",
  },
  -- LSP kinds
  kind = {
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
  },
}

return M
