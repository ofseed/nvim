---@type vim.lsp.Config
return {
  on_attach = function(client)
    -- `foldexpr` is `vim.treesitter.foldexpr` by default
    vim.wo[0][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    client.server_capabilities.documentFormattingProvider = false
  end,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      hint = {
        enable = true,
        setType = true,
      },
      codeLens = {
        enable = true,
      },
      completion = {
        postfix = '.',
        showWord = 'Disable',
        workspaceWord = false,
      },
      diagnostics = {
        disable = {
          'unused-function',
          'empty-block',
        },
      },
    },
  },
}
