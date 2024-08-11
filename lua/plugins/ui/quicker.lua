---@type LazyPluginSpec
return {
  "stevearc/quicker.nvim",
  ft = "qf",
  ---@module "quicker"
  ---@type quicker.SetupOptions
  opts = {
    keys = {
      {
        "zo",
        function()
          require("quicker").expand {
            before = 2,
            after = 2,
            add_to_existing = true,
          }
        end,
        desc = "Expand quickfix context",
      },
      {
        "zc",
        function()
          require("quicker").collapse()
        end,
        desc = "Collapse quickfix context",
      },
    },
    opts = {
      number = true,
    },
    highlight = {
      lsp = false,
    },
    max_filename_width = function()
      return math.floor(math.min(60, vim.o.columns / 4))
    end,
  },
}
