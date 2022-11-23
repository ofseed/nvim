local ok, overseer = pcall(require, "overseer")
if not ok then
  vim.notify "Could not load overseer"
  return
end

overseer.setup {}

vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>", { desc = "Run" })
vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<CR>", { desc = "Toggle" })
