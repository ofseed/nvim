local custom = require "custom"

local opts = {
  -- DEPRECATED (use mode instead): enables text annotations
  --
  -- default: true
  -- with_text = true,

  -- defines how annotations are shown
  -- default: symbol
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = "symbol_text",

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = "codicons",

  -- override preset symbols
  --
  -- default: {}
  symbol_map = custom.icons.kind,
}
return {
  "onsails/lspkind-nvim",
  event = "VeryLazy",
  config = function()
    require("lspkind").init(opts)
  end,
}
