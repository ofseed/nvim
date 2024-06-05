---@type LazyPluginSpec
return {
  "dstein64/nvim-scrollview",
  event = "VeryLazy",
  opts = {
    winblend = 50,
    signs_on_startup = {
      "conflicts",
      -- "cursor",
      "diagnostics",
      "folds",
      "loclist",
      "marks",
      "quickfix",
      "search",
      "spell",
      -- "textwidth",
      -- "trail",
    },
  },
  config = function(_, opts)
    local scrollview = require "scrollview"
    local scrollview_gitsigns = require "scrollview.contrib.gitsigns"

    scrollview.setup(opts)
    scrollview_gitsigns.setup {
      add_priority = 100,
      change_priority = 100,
      delete_priority = 100,
    }

    vim.api.nvim_set_hl(0, "ScrollViewHover", { link = "Search" })
  end,
}
