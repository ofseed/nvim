local ok, hop = pcall(require, "hop")
if not ok then
  vim.notify "Could not load hop"
  return
end

hop.setup {
  keys = "etovxqpdygfblzhckisuran",
  jump_on_sole_occurrence = false,
}

vim.keymap.set({ "n", "v" }, "sf", "<Cmd>HopChar1AC<CR>") -- Case ignored
vim.keymap.set({ "n", "v", "o" }, "<Leader><Leader>f", "<Cmd>HopChar1AC<CR>")
-- t, T not implemented yet
vim.keymap.set({ "n", "v" }, "sw", "<Cmd>HopWordAC<CR>")
vim.keymap.set({ "n", "v", "o" }, "<Leader><Leader>w", "<Cmd>HopWordAC<CR>")
-- W not implemented yet
vim.keymap.set({ "n", "v" }, "sb", "<Cmd>HopWordBC<CR>")
vim.keymap.set({ "n", "v", "o" }, "<Leader><Leader>b", "<Cmd>HopWordBC<CR>")
-- B, e, E, ge, gE not implemented yet
vim.keymap.set({ "n", "v" }, "sj", "<Cmd>HopLineStartAC<CR>")
vim.keymap.set({ "n", "v", "o" }, "<Leader><Leader>j", "<Cmd>HopLineStartAC<CR>")

vim.keymap.set({ "n", "v" }, "sk", "<Cmd>HopLineStartBC<CR>")
vim.keymap.set({ "n", "v", "o" }, "<Leader><Leader>k", "<Cmd>HopLineStartBC<CR>")
-- n, N not implemented yet
vim.keymap.set({ "n", "v" }, "ss", "<Cmd>HopChar1MW<CR>")
vim.keymap.set({ "n", "v", "o" }, "<Leader><Leader>s", "<Cmd>HopChar1MW<CR>")
