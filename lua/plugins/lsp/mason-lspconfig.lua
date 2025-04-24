---@type LazyPluginSpec
return {
  "williamboman/mason-lspconfig.nvim",
  event = {
    "Filetype",
  },
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",

    "b0o/SchemaStore.nvim",
    "nanotee/sqls.nvim",
  },
  opts = function()
    local lspconfig = require "lspconfig"

    return {
      handlers = {
        function() end,

        jsonls = function()
          lspconfig.jsonls.setup {
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
            on_attach = function(client)
              client.server_capabilities.documentFormattingProvider = false
            end,
          }
        end,

        yamlls = function()
          lspconfig.yamlls.setup {
            settings = {
              yaml = {
                keyOrdering = false,
                schemaStore = {
                  enable = false,
                  url = "",
                },
                schemas = require("schemastore").yaml.schemas {
                  ignore = {
                    -- Very easy to conflict with other `deploy.yaml`
                    "Deployer Recipe",
                  },
                },
              },
            },
          }
        end,
      },
    }
  end,
}
