return {
  "olrtg/nvim-emmet",
  lazy = true,
  init = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "Setup nvim-emmet",
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client == nil or client.name ~= "emmet_language_server" then
          return
        end

        vim.keymap.set("n", "<localleader>x", function()
          require("nvim-emmet").wrap_with_abbreviation()
        end, { buffer = bufnr, desc = "Wrap with abbreviation" })
      end,
    })
  end,
}
