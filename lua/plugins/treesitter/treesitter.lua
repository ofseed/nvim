local locals = require "locals"

return {
  "nvim-treesitter/nvim-treesitter",
  branch = locals.treesitter_dev and "main" or "master",
  event = "VeryLazy",
  dependencies = {
    { "RRethy/nvim-treesitter-endwise", cond = not locals.treesitter_dev },
  },
  build = ":TSUpdate",
  config = function()
    -- if vim.uv.os_uname().sysname == "Windows_NT" then
    --   require("nvim-treesitter.install").prefer_git = false
    -- end

    if locals.treesitter_dev then
      return
    end

    require("nvim-treesitter.configs").setup {
      ensure_installed = "all",
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
    }
  end,
}
