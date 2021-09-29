local lspkind = require "lspkind"

lspkind.init {
  -- enables text annotations
  --
  -- default: true
  with_text = true,

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = "default",

  -- override preset symbols
  --
  -- default: {}
  symbol_map = require "assets.lsp-symbols",
}
