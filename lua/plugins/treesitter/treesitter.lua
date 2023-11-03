return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  dependencies = {
    { "RRethy/nvim-treesitter-endwise" },
  },
  build = ":TSUpdate",
  config = function()
    -- if vim.uv.os_uname().sysname == "Windows_NT" then
    --   require("nvim-treesitter.install").prefer_git = false
    -- end

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
