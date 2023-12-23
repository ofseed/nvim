-- Default LSP server settigns
local M = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
  vim.notify "Could not load nvim-cmp"
  return
end

-- Add additional capabilities supported by nvim-cmp
M = cmp_nvim_lsp.default_capabilities(M)

-- Enable LSP folddingRange capability
M.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return M
