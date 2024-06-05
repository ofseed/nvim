---@type LazyPluginSpec
return {
  "mfussenegger/nvim-lint",
  enabled = false,
  opts = {
    python = { "pylint" },
  },
  config = function(_, opts)
    require("lint").linters_by_ft = opts

    vim.api.nvim_create_autocmd({
      "BufReadPost",
      "BufWritePost",
      "InsertLeave",
    }, {
      desc = "Lint",
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
