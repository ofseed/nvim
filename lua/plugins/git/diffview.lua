---@type LazyPluginSpec
return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewFileHistory",
  },
  keys = {
    { "<leader>gdo", "<Cmd>DiffviewOpen<CR>", desc = "Open" },
    { "<leader>gdc", "<Cmd>DiffviewClose<CR>", desc = "Close" },
    { "<leader>gdh", "<Cmd>DiffviewFileHistory<CR>", desc = "Open History" },
    { "<leader>gdf", "<Cmd>DiffviewFileHistory %<CR>", desc = "Current History" },
  },
  opts = function()
    local actions = require "diffview.actions"

    return {
      enhanced_diff_hl = true,
      show_help_hints = false,
      file_panel = {
        win_config = {
          width = math.floor(vim.go.columns * 0.2) > 25 and math.floor(vim.go.columns * 0.2) or 25,
        },
      },
      hooks = {
        diff_buf_win_enter = function(_, winid)
          vim.wo[winid].wrap = false
        end,
      },
      keymaps = {
        view = {
          { "n", "q", actions.close, { desc = "Close diffview" } },
          { "n", "<Esc>", actions.close, { desc = "Close diffview" } },
        },
        file_panel = {
          { "n", "q", actions.close, { desc = "Close diffview" } },
          { "n", "<Esc>", actions.close, { desc = "Close diffview" } },
        },
        file_history_panel = {
          { "n", "q", actions.close, { desc = "Close diffview" } },
          { "n", "<Esc>", actions.close, { desc = "Close diffview" } },
        },
      },
    }
  end,
}
