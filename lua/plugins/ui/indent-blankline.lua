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

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    scope = {
      -- Rely on treesitter, bad performance
      enabled = false,
      highlight = highlight,
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)

    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
