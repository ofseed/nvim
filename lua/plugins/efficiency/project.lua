return {
  "jay-babu/project.nvim", -- maintained fork
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup {}
  end,
}
