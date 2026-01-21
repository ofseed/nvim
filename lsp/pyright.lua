---@type vim.lsp.Config
return {
  -- https://www.npmjs.com/package/@delance/runtime
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
