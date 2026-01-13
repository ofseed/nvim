---@type LazyPluginSpec
return {
  'mfussenegger/nvim-jdtls',
  event = {
    'BufRead *.java',
    'BufNewFile *.java',
  },
  opts = function()
    return {
      cmd = { 'jdtls' },
      handlers = {
        ['language/status'] = function() end,
      },
      settings = {
        java = {
          inlayHints = {
            parameterNames = {
              enabled = 'all',
            },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    local jdtls = require 'jdtls'

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'java',
      desc = 'Attach jdtls',
      callback = function()
        jdtls.start_or_attach(opts, { dap = { hotcodereplace = 'auto' } })
        vim.bo.tabstop = 4
      end,
    })
  end,
}
