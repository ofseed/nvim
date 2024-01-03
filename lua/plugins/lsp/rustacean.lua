---@type LazyPluginSpec
return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = function()
      return {
        dap = {
          adapter = {
            type = "server",
            port = "${port}",
            host = "127.0.0.1",
            executable = {
              command = "codelldb",
              args = {
                "--port",
                "${port}",
                "--settings",
                vim.json.encode {
                  showDisassembly = "never",
                },
              },
            },
          },
        },
      }
    end
  end,
}
