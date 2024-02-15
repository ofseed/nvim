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
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = custom.icons.diagnostic.error,
      [vim.diagnostic.severity.WARN] = custom.icons.diagnostic.warn,
      [vim.diagnostic.severity.HINT] = custom.icons.diagnostic.hint,
      [vim.diagnostic.severity.INFO] = custom.icons.diagnostic.info,
    },
  },
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or custom.border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- LspAttach events
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "General LSP Attach",
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Setup keymaps
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover" })
    vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "LSP: Signature help" })

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Definition" })
    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Declaration" })
    vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Type definition" })
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Implementation" })
    vim.keymap.set("n", "gr", function()
      vim.lsp.buf.references { includeDeclaration = false }
    end, { buffer = bufnr, desc = "References" })

    vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
    vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })

    vim.keymap.set("n", "<leader>li", vim.lsp.buf.incoming_calls, { buffer = bufnr, desc = "Incoming calls" })
    vim.keymap.set("n", "<leader>lo", vim.lsp.buf.outgoing_calls, { buffer = bufnr, desc = "Outgoing calls" })

    -- Use conform instead
    -- vim.keymap.set("n", "<leader>F", function()
    --   vim.lsp.buf.format { async = true }
    -- end, { buffer = bufnr, desc = "Format document" })

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

    -- Enable inlay hints
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(bufnr, true)
    end

    -- Enable code lens
    -- if client and client.server_capabilities.codeLensProvider then
    --   vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
    --     buffer = bufnr,
    --     callback = function()
    --       vim.lsp.codelens.refresh()
    --     end,
    --   })
    -- end
  end,
})

-- Disable treesitter highlight after semantic tokens are applied
--[[
_G.semantic_highlight_inited = {}

vim.api.nvim_create_autocmd("LspTokenUpdate", {
  callback = function(args)
    local buf = args.buf
    if _G.semantic_highlight_inited[buf] then
      vim.treesitter.stop(buf)
      return
    end
    _G.semantic_highlight_inited[buf] = true
  end,
})
--]]
