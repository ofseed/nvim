---@type LazyPluginSpec
return {
  "yioneko/nvim-vtsls",
  init = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client.name == "vtsls" then
          vim.keymap.set(
            "n",
            "g_d",
            "<Cmd>VtsExec go_to_source_definition<CR>",
            { buffer = bufnr, desc = "Source Definition" }
          )

          vim.keymap.set(
            "n",
            "<localleader>i",
            "<Cmd>VtsExec add_missing_imports<CR>",
            { buffer = bufnr, desc = "Add missing imports" }
          )
          vim.keymap.set(
            "n",
            "<localleader>o",
            "<Cmd>VtsExec organize_imports<CR>",
            { buffer = bufnr, desc = "Organize imports" }
          )
          vim.keymap.set(
            "n",
            "<localleader>r",
            "<Cmd>VtsExec remove_unused<CR>",
            { buffer = bufnr, desc = "Remove unused variables" }
          )
          vim.keymap.set(
            "n",
            "<localleader>F",
            "<Cmd>VtsExec fix_all<CR>",
            { buffer = bufnr, desc = "Fix all" }
          )

          vim.keymap.set(
            "n",
            "<localleader>fr",
            "<Cmd>VtsExec file_references<CR>",
            { buffer = bufnr, desc = "File references" }
          )
          vim.keymap.set(
            "n",
            "<localleader>fn",
            "<Cmd>VtsExec rename_file<CR>",
            { buffer = bufnr, desc = "File rename" }
          )
        end
      end,
    })
  end,
  opts = {},
  config = function(_, opts)
    require("vtsls").config(opts)
  end,
}
