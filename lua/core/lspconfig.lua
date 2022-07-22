local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  vim.notify "Could not load lspconfig"
  return
end

local ok, mason = pcall(require, "mason-lspconfig")
if not ok then
  vim.notify "Could not load mason-lspconfig"
  return
end

-- Set diagnostic options
vim.diagnostic.config {
  virtual_text = {
    spacing = 4,
    prefix = "●",
    severity = vim.diagnostic.severity.WARN,
  },
  float = {
    severity_sort = true,
    source = "if_many",
  },
  severity_sort = true,
}

-- Set diagnostic icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- TODO: Use lsp_signature instead
vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local default = require "language.default"

mason.setup()

mason.setup_handlers {
  function(server)
    lspconfig[server].setup(default)
  end,

  clangd = function(server) end,
  rust_analyzer = function(server) end,
  tsserver = function(server) end,
  jsonls = function(server) end,

  sumneko_lua = function()
    lspconfig.sumneko_lua.setup {
      on_attach = function(client, bufnr)
        default.on_attach(client, bufnr)
        client.resolved_capabilities.document_formatting = false
      end,
      capabilities = default.capabilities,
    }
  end,
}
