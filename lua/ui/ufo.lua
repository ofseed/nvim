return {
  "kevinhwang91/nvim-ufo",
  event = "VeryLazy",
  dependencies = "kevinhwang91/promise-async",
  init = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function()
    local ufo = require "ufo"
    ufo.setup {
      close_fold_kinds = { "imports" },
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "Setup Ufo",
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- Enable foldign capabilities Ufo needs
        local ufo_capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        }
        local original_capabilities = client.server_capabilities or {}
        client.server_capabilities = vim.tbl_deep_extend("force", original_capabilities, ufo_capabilities)

        -- Set alter keymap for `K` to use both LSP hover and Ufo peek
        vim.keymap.set("n", "K", function()
          local winid = ufo.peekFoldedLinesUnderCursor()
          if not winid then
            vim.lsp.buf.hover()
          end
        end, { buffer = bufnr, desc = "LSP: Signature help" })
      end,
    })
  end,
}
