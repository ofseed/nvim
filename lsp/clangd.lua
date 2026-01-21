---@type vim.lsp.Config
return {
  cmd = {
    'clangd',
    -- Clangd displays completion items
    -- that require header insertion, with a decorator,
    -- disable it to align the completion item tags in completion menu.
    '--header-insertion-decorators=0',
  },
}
