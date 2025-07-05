---@type LazyPluginSpec
return {
  "dstein64/nvim-scrollview",
  event = "VeryLazy",
  opts = {
    winblend = 50,
    winblend_gui = 50,
    floating_windows = true,
    consider_border = true,
    excluded_filetypes = {
      "dropbar_menu",
      "cmp_docs",
      "cmp_menu",
      "blink-cmp-menu",
      "blink-cmp-documentation",
      "blink-cmp-signature",
      "noice",
    },
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
      add_highlight = "GitSignsAdd",
      add_priority = 100,
      change_priority = 100,
      change_highlight = "GitSignsChange",
      delete_priority = 100,
      delete_highlight = "GitSignsDelete",
    }

    vim.api.nvim_set_hl(0, "ScrollView", { link = "PmenuThumb" })
    vim.api.nvim_set_hl(0, "ScrollViewHover", { link = "PmenuSbar" })
  end,
}
