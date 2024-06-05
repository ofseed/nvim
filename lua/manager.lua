---@diagnostic disable-next-line: param-type-mismatch
local lazypath = vim.fs.joinpath(vim.fn.stdpath "data", "lazy", "lazy.nvim")
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
local locals = require "locals"

require("lazy").setup {
  spec = "plugins",
  ---@diagnostic disable-next-line: assign-type-mismatch
  dev = {
    path = "~/neovim/dev",
    patterns = locals.under_development,
    fallback = true,
  },
  install = {
    colorscheme = { "default" },
  },
  ui = {
    border = custom.border,
  },
  diff = {
    cmd = "diffview.nvim",
  },
  performance = {
    rtp = {
      -- Required in NixOS
      reset = false,
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
}

vim.keymap.set("n", "<leader>mp", "<Cmd>Lazy<CR>", { desc = "Plugins" })
