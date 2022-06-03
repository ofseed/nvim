local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  vim.notify "Could not load lspconfig"
  return
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 5, prefix = "●", severity_limit = "Warning" },
  severity_sort = true,
})

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

local server = require "server"

local servers = {
  -- Vim
  "vimls",

  -- Markup Languages
  "jsonls",
  "taplo",
  "lemminx",
  "ltex",

  -- Web Languages
  "html",
  "cssls",
  "tsserver",
  "eslint",
  "volar",

  "cmake",
  "pyright",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(server)
end

lspconfig.sumneko_lua.setup {
  on_attach = function(client, bufnr)
    server.on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end,
  capabilities = server.capabilities,
}
