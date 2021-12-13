local ls = require "null-ls"

ls.setup {
  sources = {
    ls.builtins.formatting.stylua,
    ls.builtins.completion.spell,
    ls.builtins.formatting.codespell,
    ls.builtins.diagnostics.codespell,
  },
}
