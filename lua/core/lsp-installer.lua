local ok, installer = pcall(require, "nvim-lsp-installer")
if not ok then
  vim.notify "Could not load lsp-installer"
  return
end

installer.setup {
  automatic_installation = false, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
}
