local M = {}

--- Wrapper for tree-sitter repeatable move,
--- avoid error when the module is not loaded
---@param forward_move_fn function
---@param backward_move_fn function
function M.make_repeatable_move_pair(forward_move_fn, backward_move_fn)
  local loaded_ts, ts_repeatable
  return function()
    if not loaded_ts then
      loaded_ts, ts_repeatable =
        pcall(require, "nvim-treesitter-textobjects.repeatable_move")
      if loaded_ts then
        forward_move_fn, backward_move_fn =
          ts_repeatable.make_repeatable_move_pair(
            forward_move_fn,
            backward_move_fn
          )
      end
    end
    return forward_move_fn()
  end, function()
    if not loaded_ts then
      loaded_ts, ts_repeatable =
        pcall(require, "nvim-treesitter-textobjects.repeatable_move")
      if loaded_ts then
        forward_move_fn, backward_move_fn =
          ts_repeatable.make_repeatable_move_pair(
            forward_move_fn,
            backward_move_fn
          )
      end
    end
    return backward_move_fn()
  end
end

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
