return {
  "RRethy/nvim-treesitter-textsubjects",
  -- Use flash instead
  enabled = false,
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
