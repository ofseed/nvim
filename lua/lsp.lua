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

vim.lsp.inlay_hint.enable()
if vim.lsp.document_highlight then
  vim.lsp.document_highlight.enable()
end

-- LspAttach events
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "General LSP Attach",
  callback = function(args)
    local bufnr = args.buf

    if vim.lsp.document_highlight then
      vim.keymap.set("n", "<leader>ld", function()
        vim.lsp.document_highlight.enable(
          not vim.lsp.document_highlight.is_enabled { bufnr = 0 },
          { bufnr = bufnr }
        )
      end, { buffer = bufnr, desc = "Toggle document highlight" })
      vim.keymap.set("n", "]r", function()
        vim.lsp.document_highlight.jump { count = vim.v.count1, refresh = true }
      end, { buffer = bufnr, desc = "Next reference" })
      vim.keymap.set("n", "[r", function()
        vim.lsp.document_highlight.jump { count = -vim.v.count1, refresh = true }
      end, { buffer = bufnr, desc = "Previous reference" })
    end

    -- Always override the default to add context
    vim.keymap.set("n", "grr", function()
      vim.lsp.buf.references { includeDeclaration = false }
    end, { buffer = bufnr, desc = "References" })

    -- Setup keymaps
    vim.keymap.set(
      "n",
      "gd",
      vim.lsp.buf.definition,
      { buffer = bufnr, desc = "Definition" }
    )
    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Declaration" })
    vim.keymap.set(
      "n",
      "gD",
      vim.lsp.buf.type_definition,
      { buffer = bufnr, desc = "Type definition" }
    )
    vim.keymap.set(
      "n",
      "gI",
      vim.lsp.buf.implementation,
      { buffer = bufnr, desc = "Implementation" }
    )

    vim.keymap.set(
      "n",
      "<leader>lr",
      vim.lsp.codelens.run,
      { buffer = bufnr, desc = "Run lens" }
    )

    vim.keymap.set(
      "n",
      "<leader>li",
      vim.lsp.buf.incoming_calls,
      { buffer = bufnr, desc = "Incoming calls" }
    )
    vim.keymap.set(
      "n",
      "<leader>lo",
      vim.lsp.buf.outgoing_calls,
      { buffer = bufnr, desc = "Outgoing calls" }
    )

    vim.keymap.set("n", "<leader>lh", function()
      vim.lsp.inlay_hint.enable(
        not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr },
        { bufnr = bufnr }
      )
    end, { buffer = bufnr, desc = "Toggle inlay hints" })

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
vim.lsp.enable {
  "clangd",
  "lua_ls",
  "pyright",
  "gopls",
  "volar",
  "vtsls",
  "zls",
}
