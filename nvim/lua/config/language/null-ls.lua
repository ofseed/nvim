local ls = require'null-ls'
local lsp = require'lspconfig'

ls.config {
  sources = { 
    ls.builtins.formatting.stylua,
    ls.builtins.formatting.prettier,
    ls.builtins.diagnostics.write_good,
    ls.builtins.code_actions.gitsigns,
  }
}
lsp['null-ls'].setup{}
