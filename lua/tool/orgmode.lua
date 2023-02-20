local ok, orgmode = pcall(require, "orgmode")
if not ok then
  vim.notify "Could not load orgmode"
  return
end

local treesitter_config = require "nvim-treesitter.configs"

-- Load custom treesitter grammar for org filetype
orgmode.setup_ts_grammar()

-- Treesitter configuration
require("nvim-treesitter.configs").setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = { "org" },
  },
  ensure_installed = { "org" }, -- Or run :TSUpdate org
}

orgmode.setup {
  org_agenda_files = { "~/Documents/org/*" },
  org_default_notes_file = "~/Documents/org/refile.org",
}
