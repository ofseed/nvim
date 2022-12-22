local ok, mason = pcall(require, "mason")
if not ok then
  vim.notify "Could not load mason"
end

mason.setup {
  ui = {
    border = "rounded",
  },
}

vim.keymap.set("n", "<leader>om", "<Cmd>Mason<CR>", { silent = true, desc = "Package manager" })
