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
  "HiPhish/rainbow-delimiters.nvim",
  event = "VeryLazy",
  opts = {
    query = {
      [""] = "rainbow-delimiters",
      latex = "rainbow-blocks",
      lua = "rainbow-blocks",
      query = "rainbow-blocks",
      verilog = "rainbow-blocks",
    },
    highlight = highlight,
  },
  config = function(_, opts)
    -- Integration with indent-blankline
    local _, ibl = pcall(require, "ibl")
    if ibl then
      local hooks = require "ibl.hooks"
      ibl.update {
        scope = {
          highlight = highlight,
        },
      }
      hooks.register(
        hooks.type.SCOPE_HIGHLIGHT,
        hooks.builtin.scope_highlight_from_extmark
      )
    end

    vim.g.rainbow_delimiters = opts
  end,
}
