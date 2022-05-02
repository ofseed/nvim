local ok, refactoring = pcall(require, "refactoring")
if not ok then
  vim.notify "Could not load refactoring"
  return
end

refactoring.setup()

-- Remaps for the refactoring operations currently offered by the plugin
vim.keymap.set("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]])
vim.keymap.set("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]])
vim.keymap.set("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]])
vim.keymap.set("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]])

-- Extract block doesn't need visual mode
vim.keymap.set("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]])
vim.keymap.set("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]])

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.keymap.set("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]])
