local ok, lastplace = pcall(require, "nvim-lastplace")
if not ok then
  vim.notify "Could not load lastplace"
  return
end

lastplace.setup {
  lastplace_ignore_buftype = { "quickfix", "nofile", "help", "alpha", "NvimTree" },
  lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
  lastplace_open_folds = true,
}
