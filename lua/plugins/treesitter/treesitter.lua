local locals = require "locals"

---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  branch = locals.treesitter_dev and "main" or "master",
  event = "VeryLazy",
  build = ":TSUpdate",
  opts = {
    ensure_installed = "all",
    highlight = {
      enable = true,
      -- Should be controlled by vimtex
      disable = { "latex" },
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    -- if vim.uv.os_uname().sysname == "Windows_NT" then
    --   require("nvim-treesitter.install").prefer_git = false
    -- end

    if locals.treesitter_dev then
      return
    end

    require("nvim-treesitter.configs").setup(opts)
  end,
}
