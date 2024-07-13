local custom = require "custom"

---@type LazyPluginSpec
return {
  ---@module "which-key"
  "folke/which-key.nvim",
  event = "VeryLazy",
  ---@type wk.Opts
  opts = {
    preset = "modern",
    win = {
      border = custom.border,
    },
    icons = {
      breadcrumb = "",
      separator = "",
      rules = false,
    },

    spec = {
      { "<leader>i", group = "insert" },
      { "<leader>m", group = "manage" },
      { "<leader>r", group = "tasks" },
      { "<leader>d", group = "debug" },
      { "<leader>D", group = "debuggee" },
      { "<leader>t", group = "toggle" },
      { "<leader>T", group = "test" },
      { "<leader>o", group = "org" },

      { "<leader>p", group = "programs" },

      { "<leader>f", group = "find" },
      { "<leader>fg", group = "git" },
      { "<leader>fd", group = "debug" },

      { "<leader>g", group = "git" },
      { "<leader>gd", group = "diffview" },

      { "<leader>s", group = "session" },
      { "<leader>sc", group = "current" },

      { "<leader>b", group = custom.prefer_tabpage and "tab" or "buffer" },
      { "<leader>bs", group = "sort" },
      { "<leader>l", group = "lsp" },
      { "<leader>lw", group = "workspace" },

      { "<leader>h", group = "helper" },
      { "<leader>hp", group = "profile" },
    },
  },
}
