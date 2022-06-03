local ok, hop = pcall(require, "hop")
if not ok then
  vim.notify "Could not load hop"
  return
end

hop.setup {
  keys = "etovxqpdygfblzhckisuran",
  jump_on_sole_occurrence = false,
}

vim.keymap.set({ "n", "v" }, "sf", "<Cmd>HopChar1AC<CR>", { desc = "Char after" }) -- Case ignored
vim.keymap.set({ "n", "v", "o" }, "<Leader>hf", "<Cmd>HopChar1AC<CR>", { desc = "Char after" })

vim.keymap.set({ "n", "v" }, "sF", "<Cmd>HopChar1BC<CR>", { desc = "Char after" }) -- Case ignored
vim.keymap.set({ "n", "v", "o" }, "<Leader>hF", "<Cmd>HopChar1BC<CR>", { desc = "Char after" })
-- t, T not implemented yet
vim.keymap.set({ "n", "v" }, "sw", "<Cmd>HopWordAC<CR>", { desc = "Word" })
vim.keymap.set({ "n", "v", "o" }, "<Leader>hw", "<Cmd>HopWordAC<CR>", { desc = "Word" })
-- W not implemented yet
vim.keymap.set({ "n", "v" }, "sb", "<Cmd>HopWordBC<CR>", { desc = "Word reverse" })
vim.keymap.set({ "n", "v", "o" }, "<Leader>hb", "<Cmd>HopWordBC<CR>", { desc = "Word reverse" })
-- B, e, E, ge, gE not implemented yet
vim.keymap.set({ "n", "v" }, "sj", "<Cmd>HopLineStartAC<CR>", { desc = "Line after" })
vim.keymap.set({ "n", "v", "o" }, "<Leader>hj", "<Cmd>HopLineStartAC<CR>", { desc = "Line after" })

vim.keymap.set({ "n", "v" }, "sk", "<Cmd>HopLineStartBC<CR>", { desc = "Line before" })
vim.keymap.set({ "n", "v", "o" }, "<Leader>hk", "<Cmd>HopLineStartBC<CR>", { desc = "Line before" })
-- n, N not implemented yet
vim.keymap.set({ "n", "v" }, "ss", "<Cmd>HopChar1MW<CR>", { desc = "Char" })
vim.keymap.set({ "n", "v", "o" }, "<Leader>hs", "<Cmd>HopChar1MW<CR>", { desc = "Char" })
