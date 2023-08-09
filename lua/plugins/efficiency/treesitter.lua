return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "windwp/nvim-ts-autotag" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "mrjones2014/nvim-ts-rainbow", enabled = false },
    { "RRethy/nvim-treesitter-endwise", enabled = false },
    { "RRethy/nvim-treesitter-textsubjects", enabled = false },
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
      context_commentstring = {
        enable = true,
      },
    }
  end,
}
