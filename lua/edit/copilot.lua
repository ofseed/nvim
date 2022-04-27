vim.g.copilot_filetypes = {
  registers = 0,
}

vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })
vim.g.copilot_no_tab_map = true
