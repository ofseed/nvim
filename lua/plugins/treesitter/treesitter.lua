---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = "VeryLazy",
  build = ":TSUpdate",
  opts = {
    ---@diagnostic disable-next-line: param-type-mismatch
    parser_install_dir = vim.fs.joinpath(vim.fn.stdpath "data", "site"),
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
    require("nvim-treesitter").setup(opts)
  end,
}
