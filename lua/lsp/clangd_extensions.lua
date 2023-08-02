local capabilities = require "capabilities"

local custom = require "custom"

capabilities = vim.tbl_extend("force", capabilities, {
  offsetEncoding = "utf-8",
})

return {
  "p00f/clangd_extensions.nvim",
  event = {
    "BufRead *.c,*cpp,*cc,*cxx,*h,*hh,*hpp,*hxx",
    "BufNewFile *.c,*cpp,*cc,*cxx,*h,*hh,*hpp,*hxx",
  },
  config = function()
    require("clangd_extensions").setup {
      server = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
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
    }

    vim.api.nvim_create_autocmd("Filetype", {
      desc = "Setup cmp scores for cmp",
      pattern = "c,cpp",
      callback = function()
        local cmp = require "cmp"
        cmp.setup.buffer {
          sorting = {
            comparators = {
              cmp.config.compare.offset,
              cmp.config.compare.exact,
              cmp.config.compare.recently_used,
              require "clangd_extensions.cmp_scores",
              cmp.config.compare.kind,
              cmp.config.compare.sort_text,
              cmp.config.compare.length,
              cmp.config.compare.order,
            },
          },
        }
      end,
    })
  end,
}
