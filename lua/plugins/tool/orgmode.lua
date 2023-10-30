local opts = {
  org_agenda_files = { "~/Documents/org/*" },
  org_default_notes_file = "~/Documents/org/refile.org",
}

return {
  "nvim-orgmode/orgmode",
  enabled = false,
  event = "VeryLazy",
  opts = opts,
  config = function()
    require("orgmode").setup_ts_grammar()
  end,
}
