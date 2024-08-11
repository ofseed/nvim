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
    highlight = {
      lsp = false,
    },
    max_filename_width = function()
      return math.floor(math.max(80, vim.o.columns / 3))
    end,
  },
  keys = {
    {
      "<leader>q",
      function()
        require("quicker").toggle()
      end,
      desc = "Toggle quickfix",
    },
  },
}
