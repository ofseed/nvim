---@type LazyPluginSpec
return {
  'jbyuki/nabla.nvim',
  ft = { 'tex', 'markdown' },
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'tex', 'markdown' },
      callback = function(args)
        local bufnr = args.buf
        vim.keymap.set('n', '<localleader>p', function()
          require('nabla').toggle_virt()
        end, {
          buffer = bufnr,
          desc = 'Toggle nabla virt text',
        })
      end,
    })
  end,
}
