local locals = require "locals"

local group = vim.api.nvim_create_augroup("ofseed", {})

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

if locals.treesitter_dev then
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(args)
      pcall(vim.treesitter.start, args.buf, args.match)
    end,
  })
end
