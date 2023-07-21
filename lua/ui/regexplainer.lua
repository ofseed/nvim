local opts = {
  -- 'narrative'
  mode = "narrative", -- TODO: 'ascii', 'graphical'

  -- automatically show the explainer when the cursor enters a regexp
  auto = false,

  -- Whether to log debug messages
  debug = false,

  -- 'split', 'popup'
  display = "popup",

  mappings = {
    show = "gR",
  },

  narrative = {
    separator = "\n",
  },
}

return {
  "bennypowers/nvim-regexplainer",
  -- Not very useful now
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = opts,
}
