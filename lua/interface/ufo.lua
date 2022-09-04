local ok, ufo = pcall(require, "ufo")
if not ok then
  vim.notify "Could not load ufo"
  return
end

-- //TODO:https://github.com/kevinhwang91/nvim-ufo/issues/4
-- vim.o.foldcolumn = "1"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

ufo.setup()
