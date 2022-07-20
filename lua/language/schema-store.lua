local ok, schemastore = pcall(require, "schemastore")
if not ok then
  vim.notify "Could not load schemastore"
end

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  vim.notify "Could not load lspconfig"
end

local default = require "language.default"

lspconfig.jsonls.setup {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
  on_attach = function(client, bufnr)
    default.on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end,
  capabilities = default.capabilities,
}
