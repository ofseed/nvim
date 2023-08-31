return {
  "aznhe21/actions-preview.nvim",
  event = "VeryLazy",
  config = function()
    require("actions-preview").setup {}

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "Setup code action preview",
      callback = function(args)
        local bufnr = args.buf

        vim.keymap.set("n", "<leader>la", function()
          require("actions-preview").code_actions()
        end, { buffer = bufnr, desc = "LSP: Code action" })
      end,
    })
  end,
}
