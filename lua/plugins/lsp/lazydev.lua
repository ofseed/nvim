---@type LazyPluginSpec
return {
  'folke/lazydev.nvim',
  ft = 'lua',
  opts = {
    library = {
      {
        path = 'luvit-meta/library',
        words = { 'vim%.uv' },
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

      -- Disable if .luarc.json exists and workspace.library is set
      local fd = vim.uv.fs_open(root_dir .. '/.luarc.json', 'r', 438)
      if fd then
        local luarc = vim.json.decode(assert(vim.uv.fs_read(fd, vim.uv.fs_fstat(fd).size)))
        return not (luarc.workspace and luarc.workspace.library)
      end
      return true
    end,
  },
}
