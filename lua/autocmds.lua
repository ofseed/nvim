local group = vim.api.nvim_create_augroup("ofseed", {})

local _, illuminate = pcall(require, "illuminate")

vim.api.nvim_create_autocmd({
  "FocusGained",
  "BufEnter",
  "CursorHold",
}, {
  group = group,
  desc = "Reload buffer on focus",
  callback = function()
    if vim.fn.getcmdwintype() == "" then
      vim.cmd "checktime"
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_on_yank", {}),
  desc = "Highlight yanked text",
  callback = function()
    pcall(illuminate.pause)
    vim.highlight.on_yank()
    pcall(illuminate.resume)
  end,
})
