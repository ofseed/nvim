local locals = require "locals"

local group = vim.api.nvim_create_augroup("ofseed", {})

-- Indent wrapped lines based on indent settings except for ignored filetypes
local ignored_filetypes = { "text", "markdown", "org" }
---@alias option_scope "global" | "local" | nil
---@param scope option_scope
local function set_breakindentopt(scope)
  local indent
  if vim.api.nvim_get_option_value("expandtab", { scope = scope }) then
    indent = vim.api.nvim_get_option_value("shiftwidth", { scope = scope })
  else
    indent = vim.api.nvim_get_option_value("tabstop", { scope = scope })
  end
  vim.api.nvim_set_option_value(
    "breakindentopt",
    "shift:" .. indent,
    { scope = scope }
  )
end
-- This autocmd implicitly rely on `vim-sleuth` to trigger
vim.api.nvim_create_autocmd({ "OptionSet" }, {
  group = group,
  pattern = { "expandtab", "shiftwidth", "tabstop" },
  desc = "Set 'breakindentopt' based on indent settings",
  callback = function(args)
    local is_ignored_filetype =
      vim.tbl_contains(ignored_filetypes, vim.bo[args.buf].filetype)
    ---@type option_scope
    local scope = vim.v.option_type
    if vim.v.option_command == "set" and not is_ignored_filetype then
      scope = nil
    end

    if scope == "local" and is_ignored_filetype then
    else
      set_breakindentopt(scope)
    end
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
