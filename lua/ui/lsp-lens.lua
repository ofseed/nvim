local opts = {
  enable = true,
  include_declaration = false, -- Reference include declaration
  sections = { -- Enable / Disable specific request
    definition = false,
    references = true,
    implementation = true,
  },
}

return {
  "VidocqH/lsp-lens.nvim",
  -- Not stable
  enabled = false,
  opts = opts,
}
