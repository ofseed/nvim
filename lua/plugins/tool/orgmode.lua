---@type LazyPluginSpec
return {
  "nvim-orgmode/orgmode",
  enabled = false,
  event = "VeryLazy",
  opts = {
    org_agenda_files = { "~/org/*" },
    org_default_notes_file = "~/org/refile.org",
  },
  config = function(_, opts)
    local orgmode = require "orgmode"
    orgmode.setup_ts_grammar()
    orgmode.setup(opts)
  end,
}
