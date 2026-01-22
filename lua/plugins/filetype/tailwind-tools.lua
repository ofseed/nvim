---@type LazyPluginSpec
return {
  'luckasRanarison/tailwind-tools.nvim',
  lazy = true,
  init = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == 'tailwindcss' then
          require 'tailwind-tools'
          return true
        end
      end,
    })
  end,
  opts = {
    conceal = {
      symbol = '…',
    },
  },
  config = function(_, opts)
    require('tailwind-tools').setup(opts)
  end,
}
