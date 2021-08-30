local diffview = require'diffview'
local callback = require'diffview.config'.diffview_callback

diffview.setup {
  diff_binaries = false,    -- Show diffs for binaries
  file_panel = {
    width = 35,
    use_icons = true        -- Requires nvim-web-devicons
  },
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]     = callback("select_next_entry"),  -- Open the diff for the next file 
      ["<s-tab>"]   = callback("select_prev_entry"),  -- Open the diff for the previous file
      ["<leader>e"] = callback("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"] = callback("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = callback("next_entry"),         -- Bring the cursor to the next file entry
      ["<down>"]        = callback("next_entry"),
      ["k"]             = callback("prev_entry"),         -- Bring the cursor to the previous file entry.
      ["<up>"]          = callback("prev_entry"),
      ["<cr>"]          = callback("select_entry"),       -- Open the diff for the selected entry.
      ["o"]             = callback("select_entry"),
      ["<2-LeftMouse>"] = callback("select_entry"),
      ["-"]             = callback("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"]             = callback("stage_all"),          -- Stage all entries.
      ["U"]             = callback("unstage_all"),        -- Unstage all entries.
      ["X"]             = callback("restore_entry"),      -- Restore entry to the state on the left side.
      ["R"]             = callback("refresh_files"),      -- Update stats and entries in the file list.
      ["<tab>"]         = callback("select_next_entry"),
      ["<s-tab>"]       = callback("select_prev_entry"),
      ["<leader>e"]     = callback("focus_files"),
      ["<leader>b"]     = callback("toggle_files"),
    }
  }
}

