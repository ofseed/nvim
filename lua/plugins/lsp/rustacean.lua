---@type LazyPluginSpec
return {
  'mrcjkb/rustaceanvim',
  ft = { 'rust' },
  opts = {
    dap = {
      adapter = {
        type = 'server',
        port = '${port}',
        host = '127.0.0.1',
        executable = {
          command = 'codelldb',
          args = {
            '--port',
            '${port}',
            '--settings',
            vim.json.encode {
              showDisassembly = 'never',
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    ---@module "rustaceanvim"
    vim.g.rustaceanvim = opts
  end,
}
