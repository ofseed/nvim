local ok, orgmode = pcall(require, "orgmode")
if not ok then
  vim.notify "Could not load orgmode"
  return
end

local treesitter_config = require "nvim-treesitter.configs"

-- Load custom tree-sitter grammar for org filetype
orgmode.setup_ts_grammar()

-- Tree-sitter configuration
treesitter_config.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = { "org" }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = { "org" }, -- Or run :TSUpdate org
}

orgmode.setup {
  org_agenda_files = { "~/Sync/org/*", "~/my-orgs/**/*" },
  org_default_notes_file = "~/Sync/org/refile.org",
}
