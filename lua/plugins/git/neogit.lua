return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  opts = {
    disable_insert_on_commit = false,
    disable_commit_confirmation = true,
    disable_builtin_notifications = true,
    kind = "split",
    integrations = {
      diffview = true,
    },
    sections = {
      stashes = {
        folded = false,
      },
      unpulled = {
        folded = false,
      },
      recent = {
        folded = false,
      },
    },
  },
  keys = {
    { "<leader>gg", "<Cmd>Neogit<CR>", desc = "Open Neogit" },
  },
}
