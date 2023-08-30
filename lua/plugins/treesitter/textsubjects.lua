return {
  "RRethy/nvim-treesitter-textsubjects",
  event = "VeryLazy",
  config = function()
    require("nvim-treesitter.configs").setup {
      textsubjects = {
        enable = true,
        prev_selection = ",",
        keymaps = {
          ["."] = "textsubjects-smart",
          [";"] = "textsubjects-container-outer",
          ["i;"] = "textsubjects-container-inner",
        },
      },
    }
  end,
}
