local custom = require 'custom'

---@type LazyPluginSpec
return {
  'p00f/clangd_extensions.nvim',
  ft = {
    'c',
    'cpp',
  },
  opts = {
    memory_usage = {
      border = custom.border,
    },
    symbol_info = {
      border = custom.border,
    },
  },
  config = function(_, opts)
    require('clangd_extensions').setup(opts)
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('clangd_extesnion', {}),
      desc = 'Setup clangd_extesnion keymap for cmp',
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil or client.name ~= 'clangd' then
          return
        end
        vim.keymap.set(
          'n',
          '<localleader>t',
          '<cmd>ClangdAST<CR>',
          { buffer = bufnr, desc = 'Show AST' }
        )
        vim.keymap.set(
          'n',
          '<localleader><leader>',
          '<cmd>ClangdSwitchSourceHeader<CR>',
          { buffer = bufnr, desc = 'Switch between source and header' }
        )
        vim.keymap.set(
          'n',
          '<localleader>h',
          '<cmd>ClangdTypeHierarchy<CR>',
          { buffer = bufnr, desc = 'Show type hierarchy' }
        )
        vim.keymap.set(
          'n',
          '<localleader>m',
          '<cmd>ClangdMemoryUsage<CR>',
          { buffer = bufnr, desc = 'Clangd memory usage' }
        )
      end,
    })
  end,
}
