local ls = require'null-ls'
local lsp = require'lspconfig'

ls.config {
  sources = { ls.builtins.formatting.stylua }
}
lsp['null-ls'].setup{}
