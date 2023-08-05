return {
  "kevinhwang91/nvim-ufo",
  event = "VeryLazy",
  dependencies = "kevinhwang91/promise-async",
  init = function()
    vim.api.nvim_create_autocmd("BufWinEnter", {
      desc = "Set foldcolumn when current is a file",
      callback = function()
        if vim.bo.buftype == "" then
          vim.wo.foldcolumn = "1"
        end
      end,
    })
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function()
    require("ufo").setup {
      close_fold_kinds = { "imports" },
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "Setup Ufo `K` with LSP hover",
      callback = function(args)
        local bufnr = args.buf

        vim.keymap.set("n", "K", function()
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          if not winid then
            vim.lsp.buf.hover()
          end
        end, { buffer = bufnr, desc = "LSP: Signature help" })
      end,
    })
  end,
}
