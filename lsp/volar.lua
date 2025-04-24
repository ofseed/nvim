---@type vim.lsp.Config
return {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}
