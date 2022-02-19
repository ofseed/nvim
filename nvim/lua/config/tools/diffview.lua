local ok, diffview = pcall(require, "diffview")
if not ok then
  return
end

local callback = require("diffview.config").diffview_callback

diffview.setup {
  diff_binaries = false, -- Show diffs for binaries
  use_icons = true, -- Requires nvim-web-devicons
  file_panel = {
    position = "left", -- One of 'left', 'right', 'top', 'bottom'
    width = 35, -- Only applies when position is 'left' or 'right'
    height = 10, -- Only applies when position is 'top' or 'bottom'
  },
  file_history_panel = {
    position = "bottom",
    width = 35,
    height = 16,
    log_options = {
      max_count = 256, -- Limit the number of commits
      follow = false, -- Follow renames (only for single file)
      all = false, -- Include all refs under 'refs/' including HEAD
      merges = false, -- List only merge commits
      no_merges = false, -- List no merge commits
      reverse = false, -- List commits in reverse order
    },
  },
  key_bindings = {
    disable_defaults = false, -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"] = callback "select_next_entry", -- Open the diff for the next file
      ["<s-tab>"] = callback "select_prev_entry", -- Open the diff for the previous file
      ["<leader>e"] = callback "focus_files", -- Bring focus to the files panel
      ["<leader>b"] = callback "toggle_files", -- Toggle the files panel.
    },
    file_panel = {
      ["j"] = callback "next_entry", -- Bring the cursor to the next file entry
      ["<down>"] = callback "next_entry",
      ["k"] = callback "prev_entry", -- Bring the cursor to the previous file entry.
      ["<up>"] = callback "prev_entry",
      ["<cr>"] = callback "select_entry", -- Open the diff for the selected entry.
      ["o"] = callback "select_entry",
      ["<2-LeftMouse>"] = callback "select_entry",
      ["-"] = callback "toggle_stage_entry", -- Stage / unstage the selected entry.
      ["S"] = callback "stage_all", -- Stage all entries.
      ["U"] = callback "unstage_all", -- Unstage all entries.
      ["X"] = callback "restore_entry", -- Restore entry to the state on the left side.
      ["R"] = callback "refresh_files", -- Update stats and entries in the file list.
      ["<tab>"] = callback "select_next_entry",
      ["<s-tab>"] = callback "select_prev_entry",
      ["<leader>e"] = callback "focus_files",
      ["<leader>b"] = callback "toggle_files",
    },
    file_history_panel = {
      ["g!"] = callback "options", -- Open the option panel
      ["<C-d>"] = callback "open_in_diffview", -- Open the entry under the cursor in a diffview
      ["zR"] = callback "open_all_folds",
      ["zM"] = callback "close_all_folds",
      ["j"] = callback "next_entry",
      ["<down>"] = callback "next_entry",
      ["k"] = callback "prev_entry",
      ["<up>"] = callback "prev_entry",
      ["<cr>"] = callback "select_entry",
      ["o"] = callback "select_entry",
      ["<2-LeftMouse>"] = callback "select_entry",
      ["<tab>"] = callback "select_next_entry",
      ["<s-tab>"] = callback "select_prev_entry",
      ["<leader>e"] = callback "focus_files",
      ["<leader>b"] = callback "toggle_files",
    },
    option_panel = {
      ["<tab>"] = callback "select",
      ["q"] = callback "close",
    },
  },
}
