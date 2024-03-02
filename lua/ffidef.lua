local ffi = require "ffi"

---@class foldinfo_T
---@field start integer
---@field level integer
---@field llevel integer
---@field lines integer
ffi.cdef [[
typedef struct {
    int start;  // line number where deepest fold starts
    int level;  // fold level, when zero other fields are N/A
    int llevel; // lowest level that starts in v:lnum
    int lines;  // number of lines from v:lnum to end of closed fold
} foldinfo_T;
]]

ffi.cdef [[
typedef struct {} Error;
typedef struct {} win_T;
foldinfo_T fold_info(win_T* win, int lnum);
win_T *find_window_by_handle(int Window, Error *err);
]]

return ffi
