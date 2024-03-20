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
  config = function()
    local lspconfig = require "lspconfig"

    local capabilities = require "capabilities"

    require("mason-lspconfig").setup {
      handlers = {
        function(server)
          lspconfig[server].setup { capabilities = capabilities }
        end,

        rust_analyzer = function() end,
        jdtls = function() end,
        tsserver = function() end,

        lua_ls = function()
          lspconfig.lua_ls.setup {
            on_attach = function(client, bufnr)
              client.server_capabilities.documentFormattingProvider = false
            end,
            capabilities = capabilities,
            before_init = function(...)
              require("neodev.lsp").before_init(...)
            end,
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
            on_attach = function(client, bufnr)
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
            on_attach = function(client, bufnr)
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
            on_attach = function(client, bufnr)
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
                schemas = require("schemastore").yaml.schemas(),
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
