local custom = require "custom"

---@type LazyPluginSpec
return {
  "p00f/clangd_extensions.nvim",
  ft = {
    "c",
    "cpp",
  },
  opts = {
    memory_usage = {
      border = custom.border,
    },
    symbol_info = {
      border = custom.border,
    },
  },
  config = function(_, opts)
    require("clangd_extensions").setup(opts)

    local group = vim.api.nvim_create_augroup("clangd_extesnion", {
      clear = true,
    })

    local has_cmp, cmp = pcall(require, "cmp")
    if has_cmp then
      vim.api.nvim_create_autocmd("Filetype", {
        group = group,
        desc = "Setup clangd_extension scores for cmp",
        pattern = "c,cpp",
        callback = function()
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
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = group,
      desc = "Setup clangd_extesnion keymap for cmp",
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil or client.name ~= "clangd" then
          return
        end
        vim.keymap.set(
          "n",
          "<localleader>t",
          "<cmd>ClangdAST<CR>",
          { buffer = bufnr, desc = "Show AST" }
        )
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
    })
  end,
}
