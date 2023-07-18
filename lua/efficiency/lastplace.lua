local opts = {
  lastplace_ignore_buftype = { "quickfix", "nofile", "help", "alpha", "NvimTree" },
  lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
  lastplace_open_folds = true,
}

return {
  "ethanholz/nvim-lastplace",
  opts = opts
}
