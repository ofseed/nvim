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
  on_attach = default.on_attach,
  capabilities = default.capabilities,
}
