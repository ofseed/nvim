local custom = require "custom"

---@type LazyPluginSpec
return {
  "akinsho/flutter-tools.nvim",
  event = {
    "BufRead *.dart",
    "BufNewFile *.dart",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    ui = {
      border = custom.border,
    },
    lsp = {
      on_attach = function(client, bufnr)
        vim.keymap.set(
          "n",
          "<localleader>o",
          "<Cmd>FlutterOutlineOpen<CR>",
          { buffer = bufnr, desc = "Flutter Outline" }
        )
        vim.keymap.set(
          "n",
          "<localleader>r",
          "<Cmd>FlutterRun<CR>",
          { buffer = bufnr, desc = "Run" }
        )
        vim.keymap.set(
          "n",
          "<localleader>q",
          "<Cmd>FlutterQuit<CR>",
          { buffer = bufnr, desc = "Quit" }
        )
      end,
    },
  },
}
