return {
  "aznhe21/actions-preview.nvim",
  lazy = true,
  init = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "Setup code action preview",
      callback = function(args)
        local bufnr = args.buf

        vim.keymap.set({ "n", "v" }, "<leader>la", function()
          require("actions-preview").code_actions()
        end, { buffer = bufnr, desc = "LSP: Code action" })
      end,
    })
  end,
  config = function()
    require("actions-preview").setup {}
  end,
}
