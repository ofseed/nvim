local ok, lens = pcall(require, "lsp-lens")
if not ok then
  vim.notify "Could not load lsp-lens"
end

lens.setup {
  enable = true,
  include_declaration = false, -- Reference include declaration
  sections = { -- Enable / Disable specific request
    definition = false,
    references = true,
    implementation = true,
  },
}
