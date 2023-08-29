local M = {}

function M.firstToUpper(str)
  return (str:gsub("^%l", string.upper))
end

return M
