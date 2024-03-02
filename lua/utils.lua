local M = {}

--- Turn the first letter of a string to uppercase
---@param str string
---@return string uppercased
function M.firstToUpper(str)
  return (str:gsub("^%l", string.upper))
end

-- FFI
local ffi = require "ffidef"
local error = ffi.new "Error"

---@param winid number
---@param lnum number
---@return foldinfo_T | nil
function M.fold_info(winid, lnum)
  local win_T_ptr = ffi.C.find_window_by_handle(winid, error)
  if win_T_ptr == nil then
    return
  end
  return ffi.C.fold_info(win_T_ptr, lnum)
end

return M
