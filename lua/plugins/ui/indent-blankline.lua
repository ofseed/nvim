return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  branch = "v3",
  opts = {},
  config = function(_, opts)
    require("ibl").setup(opts)
  end,
}
