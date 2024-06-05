---@type LazyPluginSpec
return {
  "vuki656/package-info.nvim",
  event = {
    "BufRead package.json",
    "BufRead package-lock.json",
  },
  dependencies = "MunifTanjim/nui.nvim",
  opts = {
    package_manager = "pnpm",
  },
  config = function(_, opts)
    require("package-info").setup(opts)

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
