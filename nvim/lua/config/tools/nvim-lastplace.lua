local lastplace = require "nvim-lastplace"

lastplace.setup {
  lastplace_ignore_buftype = { "quickfix", "nofile", "help", "alpha", "NvimTree" },
  lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
  lastplace_open_folds = true,
}
