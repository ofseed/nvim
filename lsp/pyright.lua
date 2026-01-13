---@type vim.lsp.Config
return {
  cmd = { 'delance-langserver', '--stdio' },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'off',
        inlayHints = {
          callArgumentNames = 'partial',
          functionReturnTypes = true,
          pytestParameters = true,
          variableTypes = true,
        },
      },
    },
  },
}
