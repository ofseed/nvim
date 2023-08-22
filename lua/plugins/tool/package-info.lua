return {
  "vuki656/package-info.nvim",
  event = {
    "BufRead package.json",
    "BufRead package-lock.json",
  },
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("package-info").setup {
      package_manager = "pnpm",
    }

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
