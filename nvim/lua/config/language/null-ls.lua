local ls = require "null-ls"
local lsp = require "lspconfig"

ls.config {
  sources = {
    ls.builtins.formatting.stylua,
    ls.builtins.formatting.prettier,
    ls.builtins.diagnostics.write_good,
    ls.builtins.diagnostics.codespell,
  },
}
lsp["null-ls"].setup {}
