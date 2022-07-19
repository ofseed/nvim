-- Default LSP server settigns
local M = {}

local ok, navic = pcall(require, "nvim-navic")
if not ok then
  vim.notify "Could not load navic"
  return
end

local ok, illuminate = pcall(require, "illuminate")
if not ok then
  vim.notify "Could not load illuminate"
end

local ok, aerial = pcall(require, "aerial")
if not ok then
  vim.notify "Could not load aerial"
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
  vim.notify "Could not load nvim-cmp"
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Add additional capabilities supported by nvim-cmp
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
-- capabilities.textDocument.codeLens = true

M.on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local bufopts = { silent = true, buffer = bufnr }
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover" })
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "LSP: Signature help" })

  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Diagnostic" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Diagnostic" })

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Definition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Declaration" })
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Implementation" })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })

  vim.keymap.set("n", "<leader>F", vim.lsp.buf.formatting, { buffer = bufnr, desc = "Format document" })

  vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
  vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, { buffer = bufnr, desc = "Diagnostic list" })
  vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { buffer = bufnr, desc = "Diagnostic float" })

  vim.keymap.set(
    "n",
    "<leader>lwa",
    vim.lsp.buf.add_workspace_folder,
    { buffer = bufnr, desc = "Add workspace folder" }
  )
  vim.keymap.set(
    "n",
    "<leader>lwr",
    vim.lsp.buf.remove_workspace_folder,
    { buffer = bufnr, desc = "Remove workspace folder" }
  )
  vim.keymap.set("n", "<leader>lwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = bufnr, desc = "List workspace folders" })

  navic.attach(client, bufnr)
  illuminate.on_attach(client)
  aerial.on_attach(client)
  -- require("virtualtypes").on_attach(client)
end

return M
