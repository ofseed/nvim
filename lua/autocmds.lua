local locals = require "locals"

local group = vim.api.nvim_create_augroup("ofseed", {})

-- Indent wrapped lines based on indent settings except for ignored filetypes
local ignored_filetypes = { "text", "markdown", "org" }
---@param scope "global" | "local"
local function set_breakindentopt(scope)
  vim.api.nvim_set_option_value(
    "breakindentopt",
    "shift:" .. (vim.o.expandtab and vim.o.shiftwidth or vim.o.tabstop),
    { scope = scope }
  )
end
set_breakindentopt "global"
vim.api.nvim_create_autocmd({ "OptionSet" }, {
  group = group,
  pattern = { "shiftwidth", "tabstop" },
  desc = "Set 'breakindentopt' based on indent settings",
  callback = function(args)
    if
      vim.v.option_type == "local"
      and vim.tbl_contains(ignored_filetypes, vim.bo[args.buf].filetype)
    then
    else
      set_breakindentopt(vim.v.option_type)
    end
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = ignored_filetypes,
  callback = function()
    vim.opt_local.breakindentopt = {}
  end,
})

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
  --- A specific group easy to override
  group = vim.api.nvim_create_augroup("highlight_on_yank", {}),
  desc = "Briefly highlight yanked text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Filetype specific
vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "qf",
  desc = "Disallow change buf for quickfix",
  callback = function()
    vim.wo.winfixbuf = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "go",
  desc = "Set indent for go",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = false
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
