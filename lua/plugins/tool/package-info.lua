local opts = {
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

return {
  "vuki656/package-info.nvim",
  event = {
    "BufRead package.json",
    "BufRead package-lock.json",
  },
  dependencies = "MunifTanjim/nui.nvim",
  opts = opts,
  config = function()
    vim.keymap.set("n", "<localleader>s", function()
      require("package-info").show()
    end, { desc = "Show package versions" })
    vim.keymap.set("n", "<localleader>c", function()
      require("package-info").hide()
    end, { desc = "Hide package versions" })
    vim.keymap.set("n", "<localleader>u", function()
      require("package-info").update()
    end, { desc = "Update package on line" })
    vim.keymap.set("n", "<localleader>d", function()
      require("package-info").delete()
    end, { desc = "Delete package on line" })
    vim.keymap.set("n", "<localleader>i", function()
      require("package-info").install()
    end, { desc = "Install a new package" })
    vim.keymap.set("n", "<localleader>p", function()
      require("package-info").change_version()
    end, { desc = "Install a different package version" })
  end,
}
