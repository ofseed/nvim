local ok, orgmode = pcall(require, "orgmode")
if not ok then
  vim.notify "Could not load orgmode"
  return
end

-- Load custom treesitter grammar for org filetype
orgmode.setup_ts_grammar()

orgmode.setup {
  org_agenda_files = { "~/Documents/org/*" },
  org_default_notes_file = "~/Documents/org/refile.org",
}
