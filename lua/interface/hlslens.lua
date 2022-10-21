local ok, hlslens = pcall(require, "hlslens")
if not ok then
  vim.notify "Could not load hlslens"
  return
end

hlslens.setup {}

vim.keymap.set(
  "n",
  "n",
  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { silent = true }
)
vim.keymap.set(
  "n",
  "N",
  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { silent = true }
)
vim.keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
vim.keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
vim.keymap.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], { silent = true })
vim.keymap.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], { silent = true })

vim.keymap.set("n", "<Leader>l", ":noh<CR>", { silent = true })
