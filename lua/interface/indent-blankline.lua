local opts = {
  show_current_context = true,
  show_current_context_start = true,
  -- use_treesitter = true,
  -- use_treesitter_scope = true,
  filetype_exclude = {
    "help",
    "OverseerForm",
  },
}

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = opts,
}
