local ok, gitlinker = pcall(require, "gitlinker")
if not ok then
  vim.notify "Could not load gitlinker"
  return
end

local hosts = require "gitlinker.hosts"

gitlinker.setup {
  opts = {
    remote = nil, -- force the use of a specific remote
    -- adds current line nr in the url for normal mode
    add_current_line_on_normal_mode = true,
    -- callback for what to do with the url
    action_callback = require("gitlinker.actions").copy_to_clipboard,
    -- print the url after performing the action
    print_url = true,
  },
  callbacks = {
    ["github.com"] = hosts.get_github_type_url,
    ["gitlab.com"] = hosts.get_gitlab_type_url,
    ["try.gitea.io"] = hosts.get_gitea_type_url,
    ["codeberg.org"] = hosts.get_gitea_type_url,
    ["bitbucket.org"] = hosts.get_bitbucket_type_url,
    ["try.gogs.io"] = hosts.get_gogs_type_url,
    ["git.sr.ht"] = hosts.get_srht_type_url,
    ["git.launchpad.net"] = hosts.get_launchpad_type_url,
    ["repo.or.cz"] = hosts.get_repoorcz_type_url,
    ["git.kernel.org"] = hosts.get_cgit_type_url,
    ["git.savannah.gnu.org"] = hosts.get_cgit_type_url,
  },
  -- default mapping to call url generation with action_callback
  mappings = "<leader>gy",
}
