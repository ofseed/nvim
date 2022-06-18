local ok, info = pcall(require, "package-info")
if not ok then
  vim.notify "Could not load package info"
  return
end

info.setup {
  colors = {
    up_to_date = "#3C4048", -- Text color for up to date package virtual text
    outdated = "#d19a66", -- Text color for outdated package virtual text
  },
  icons = {
    enable = true, -- Whether to display icons
    style = {
      up_to_date = "|  ", -- Icon for up to date packages
      outdated = "|  ", -- Icon for outdated packages
    },
  },
  autostart = true, -- Whether to autostart when `package.json` is opened
  hide_up_to_date = true, -- It hides up to date versions when displaying virtual text
  hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
  -- Can be `npm` or `yarn`. Used for `delete`, `install` etc...
  -- The plugin will try to auto-detect the package manager based on
  -- `yarn.lock` or `package-lock.json`. If none are found it will use the
  -- provided one, if nothing is provided it will use `yarn`
  package_manager = "npm",
}

vim.keymap.set("n", "<Leader><Leader>s", require("package-info").show, { desc = "Show package versions" })
vim.keymap.set("n", "<Leader><Leader>c", require("package-info").hide, { desc = "Hide package versions" })
vim.keymap.set("n", "<Leader><Leader>u", require("package-info").update, { desc = "Update package on line" })
vim.keymap.set("n", "<Leader><Leader>d", require("package-info").delete, { desc = "Delete package on line" })
vim.keymap.set("n", "<Leader><Leader>i", require("package-info").install, { desc = "Install a new package" })
vim.keymap.set( "n", "<Leader><Leader>p", require("package-info").change_version, { desc = "Install a different package version" })
