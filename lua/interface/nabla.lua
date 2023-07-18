return {
  "jbyuki/nabla.nvim",
  ft = { "tex", "markdown" },
  config = function()
    vim.keymap.set("n", "<leader>p", function()
      require("nabla").popup()
    end)
  end,
}
