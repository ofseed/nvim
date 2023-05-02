local M = {}

M.border = "rounded"

M.width = function()
  local columns = vim.go.columns
  return math.floor(columns * 0.2) > 25 and math.floor(columns * 0.2) or 25
end

M.icons = {
  diagnostic = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  },
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
