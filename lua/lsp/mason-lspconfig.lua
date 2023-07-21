local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  vim.notify "Could not load lspconfig"
  return
end

local custom = require "custom"

-- Set diagnostic options
vim.diagnostic.config {
  virtual_text = {
    spacing = 4,
    prefix = "●",
    severity = vim.diagnostic.severity.ERROR,
  },
  float = {
    severity_sort = true,
    source = "if_many",
  },
  severity_sort = true,
}

local function firstToUpper(str)
  return (str:gsub("^%l", string.upper))
end

-- Set diagnostic icons
for type, icon in pairs(custom.icons.diagnostic) do
  local hl = "DiagnosticSign" .. firstToUpper(type)
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- TODO: Use lsp_signature instead
vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or custom.border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local default = require "default"

local opts = {
  handlers = {
    function(server)
      lspconfig[server].setup(default)
    end,

    clangd = function(server) end,
    rust_analyzer = function(server) end,
    gopls = function(server) end,
    jdtls = function(server) end,
    tsserver = function(server) end,

    lua_ls = function()
      lspconfig.lua_ls.setup {
        on_attach = function(client, bufnr)
          default.on_attach(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
        end,
        capabilities = default.capabilities,
        settings = {
          Lua = {
            hint = {
              enable = true,
              setType = true,
              arrayIndex = "Disable",
            },
            codelens = {
              enable = true,
            },
            completion = {
              postfix = ".",
              showWord = "Disable",
              workspaceWord = false,
            },
          },
        },
      }
    end,

    volar = function()
      lspconfig.volar.setup {
        on_attach = function(client, bufnr)
          default.on_attach(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
        end,
        capabilities = default.capabilities,
      }
    end,

    pyright = function()
      lspconfig.pyright.setup {
        on_attach = default.on_attach,
        capabilities = default.capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
            },
          },
        },
      }
    end,

    yamlls = function()
      lspconfig.yamlls.setup {
        on_attach = default.on_attach,
        capabilities = default.capabilities,
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
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
          default.on_attach(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
        end,
        capabilities = default.capabilities,
      }
    end,
  },
}

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "b0o/SchemaStore.nvim",
  },
  after = "mason.nvim",
  opts = opts,
}
