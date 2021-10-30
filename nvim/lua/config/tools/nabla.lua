local nabla = require "nabla"

nabla.popup {
  boder = "rounded",
}

vim.api.nvim_set_keymap("n", "<leader>p", ":lua require'nabla'.popup()<CR>", { noremap = true })
