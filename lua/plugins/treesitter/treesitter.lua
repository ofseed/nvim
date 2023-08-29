return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  dependencies = {
    { "windwp/nvim-ts-autotag" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "RRethy/nvim-treesitter-endwise" },
  },
  build = ":TSUpdate",
  config = function()
    if vim.uv.os_uname().sysname == "Windows" then
      require("nvim-treesitter.install").prefer_git = false
    end

    require("nvim-treesitter.configs").setup {
      ensure_installed = "all",
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
      },
    }
  end,
}
