-- Wrapper to avoid local defined variables file non-existent.
local M = {}

local _, defined = pcall(require, "defined-locals")

if defined and type(defined) == "table" then
  M = defined
end

return M
