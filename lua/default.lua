-- Default LSP server settigns
local M = {}

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
  vim.notify "Could not load nvim-cmp"
  return
end

-- Add additional capabilities supported by nvim-cmp
M.capabilities = cmp_nvim_lsp.default_capabilities()

-- Enable LSP folddingRange capability
M.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return M
