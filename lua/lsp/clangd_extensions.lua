local default = require "default"

local custom = require "custom"

local capabilities = vim.tbl_extend("force", default.capabilities, {
  offsetEncoding = "utf-8",
})

return {
  "p00f/clangd_extensions.nvim",
  event = {
    "BufRead *.c,*cpp,*cc,*cxx,*h,*hh,*hpp,*hxx",
    "BufNewFile *.c,*cpp,*cc,*cxx,*h,*hh,*hpp,*hxx",
  },
  opts = {
    server = {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        default.on_attach(client, bufnr)
        vim.keymap.set("n", "<localleader>t", "<cmd>ClangdAST<CR>", { buffer = bufnr, desc = "Show AST" })
        vim.keymap.set(
          "n",
          "<localleader><leader>",
          "<cmd>ClangdSwitchSourceHeader<CR>",
          { buffer = bufnr, desc = "Switch between source and header" }
        )
        vim.keymap.set(
          "n",
          "<localleader>h",
          "<cmd>ClangdTypeHierarchy<CR>",
          { buffer = bufnr, desc = "Show type hierarchy" }
        )
        vim.keymap.set(
          "n",
          "<localleader>m",
          "<cmd>ClangdMemoryUsage<CR>",
          { buffer = bufnr, desc = "Clangd memory usage" }
        )
      end,
    },
    memory_usage = {
      border = custom.border,
    },
    symbol_info = {
      border = custom.border,
    },
  },
}
