-- //TODO: https://github.com/kevinhwang91/nvim-ufo/issues/4
-- //TODO: https://github.com/neovim/neovim/pull/17446
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local opts = {
  close_fold_kinds = { "imports" },
}

return {
  "kevinhwang91/nvim-ufo",
  event = "VeryLazy",
  dependencies = "kevinhwang91/promise-async",
  opts = opts,
}
