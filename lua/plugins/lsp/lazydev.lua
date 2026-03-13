---@type LazyPluginSpec
return {
  ---@module 'lazydev'
  'folke/lazydev.nvim',
  ft = 'lua',
  ---@type lazydev.Config
  opts = {
    library = {
      {
        path = 'nvim-lspconfig',
        words = { 'lspconfig' },
      },
      {
        path = 'lazy.nvim',
        words = { 'Lazy.*Spec' },
      },
    },
    enabled = function(root_dir)
      if vim.g.lazydev_enabled == false then
        return false
      end

      -- Disable if workspace.library is set.
      local fd = vim.uv.fs_open(root_dir .. '/.luarc.json', 'r', 438)
      if fd then
        local luarc = vim.json.decode(assert(vim.uv.fs_read(fd, vim.uv.fs_fstat(fd).size)))
        return not (luarc.workspace and luarc.workspace.library)
      end
      return true
    end,
  },
}
