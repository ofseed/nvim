local root = vim.fs.joinpath(vim.fn.stdpath "data", "/lazy")
local lazypath = vim.fs.joinpath(root, "lazy.nvim")
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end
vim.opt.runtimepath:prepend(lazypath)

local custom = require "custom"

require("lazy").setup("plugins", {
  root = root,
  dev = {
    path = "~/Documents/code/nvim",
    patterns = {
      "ofseed",
    },
    fallback = true,
  },
  ui = {
    border = custom.border,
  },
  diff = {
    cmd = "diffview.nvim",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.cmd.colorscheme(custom.theme)
