---@type LazyPluginSpec
return {
  'vuki656/package-info.nvim',
  event = {
    'BufRead package.json',
    'BufRead package-lock.json',
  },
  init = function()
    vim.api.nvim_create_autocmd('BufRead', {
      pattern = { 'package.json', 'package-lock.json' },
      callback = function(args)
        local bufnr = args.buf

        vim.keymap.set('n', '<localleader>s', function()
          require('package-info').show()
        end, { desc = 'Show package versions', buffer = bufnr })
        vim.keymap.set('n', '<localleader>c', function()
          require('package-info').hide()
        end, { desc = 'Hide package versions', buffer = bufnr })
        vim.keymap.set('n', '<localleader>u', function()
          require('package-info').update()
        end, { desc = 'Update package on line', buffer = bufnr })
        vim.keymap.set('n', '<localleader>d', function()
          require('package-info').delete()
        end, { desc = 'Delete package on line', buffer = bufnr })
        vim.keymap.set('n', '<localleader>i', function()
          require('package-info').install()
        end, { desc = 'Install a new package', buffer = bufnr })
        vim.keymap.set('n', '<localleader>p', function()
          require('package-info').change_version()
        end, {
          desc = 'Install a different package version',
          buffer = bufnr,
        })
      end,
    })
  end,
  dependencies = 'MunifTanjim/nui.nvim',
  opts = {
    package_manager = 'pnpm',
  },
}
