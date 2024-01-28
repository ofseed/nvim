-- Highlight group from rainbow-delimiters
local highlight = {
  "RainbowDelimiterRed",
  "RainbowDelimiterYellow",
  "RainbowDelimiterBlue",
  "RainbowDelimiterOrange",
  "RainbowDelimiterGreen",
  "RainbowDelimiterViolet",
  "RainbowDelimiterCyan",
}

---@type LazyPluginSpec
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    indent = {
      char = "▏", -- Thiner, not suitable when enable scope
      tab_char = "▏",
    },
    scope = {
      -- Rely on treesitter, bad performance
      enabled = false,
      -- highlight = highlight,
    },
  },
  config = function(_, opts)
    local ibl = require "ibl"
    local hooks = require "ibl.hooks"

    ibl.setup(opts)
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
