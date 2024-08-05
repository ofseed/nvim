local capabilities = require "capabilities"

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
        function(server)
          lspconfig[server].setup { capabilities = capabilities }
        end,

        rust_analyzer = function() end,
        jdtls = function() end,
        tsserver = function() end,

        lua_ls = function()
          lspconfig.lua_ls.setup {
            on_attach = function(client)
              client.server_capabilities.documentFormattingProvider = false
            end,
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                hint = {
                  enable = true,
                  setType = true,
                },
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = "Replace",
                  postfix = ".",
                  showWord = "Disable",
                  workspaceWord = false,
                },
              },
            },
          }
        end,

        gopls = function()
          lspconfig.gopls.setup {
            on_attach = function(client)
              client.server_capabilities.documentFormattingProvider = false
            end,
            capabilities = capabilities,
            settings = {
              gopls = {
                hints = {
                  assignVariableTypes = true,
                  compositeLiteralFields = true,
                  compositeLiteralTypes = true,
                  constantValues = true,
                  functionTypeParameters = true,
                  parameterNames = true,
                  rangeVariableTypes = true,
                },
              },
            },
          }
        end,

        volar = function()
          lspconfig.volar.setup {
            on_attach = function(client)
              client.server_capabilities.documentFormattingProvider = false
            end,
            capabilities = capabilities,
          }
        end,

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
            capabilities = capabilities,
          }
        end,

        yamlls = function()
          lspconfig.yamlls.setup {
            capabilities = capabilities,
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

        sqls = function()
          lspconfig.sqls.setup {
            on_attach = function(client, bufnr)
              require("sqls").on_attach(client, bufnr)
            end,
          }
        end,
      },
    }
  end,
}
