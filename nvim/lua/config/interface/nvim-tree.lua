local vim = vim

vim.g.nvim_tree_side = "left"
vim.g.nvim_tree_width = 30 -- can be width_in_columns or 'width_in_percent%'
vim.g.nvim_tree_ignore = {}
vim.g.nvim_tree_gitignore = 0
vim.g.nvim_tree_auto_open = 1 -- opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 1 -- closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = { "dashboard" } -- don't auto open tree on specific filetypes.
vim.g.nvim_tree_quit_on_open = 0 -- closes the tree when you open a file
vim.g.nvim_tree_follow = 1 -- this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_indent_markers = 1 -- this option shows indent markers when folders are open
vim.g.nvim_tree_hide_dotfiles = 1 --  this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_git_hl = 1 -- will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 -- will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ":~" -- See :help filename-modifiers for more options
vim.g.nvim_tree_tab_open = 1 -- will open the tree when entering a new tab and the tree was previously open
vim.g.nvim_tree_auto_resize = 0 -- will resize the tree to its saved width when opening a file
vim.g.nvim_tree_disable_netrw = 0 -- disables netrw
vim.g.nvim_tree_hijack_netrw = 1 -- prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 0 --  compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_lsp_diagnostics = 0 -- will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
vim.g.nvim_tree_disable_window_picker = 1 -- will disable the window picker.
vim.g.nvim_tree_hijack_cursor = 0 -- when moving cursor in the tree, will position the cursor at the start of the file on the current line
vim.g.nvim_tree_icon_padding = " " -- used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
vim.g.nvim_tree_update_cwd = 1 -- will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
vim.g.nvim_tree_window_picker_exclude = {
  filetype = {
    "packer",
    "qf",
  },
  buftype = {
    "terminal",
  },
}
-- Dictionary of buffer option names mapped to a list of option values that
-- indicates to the window picker that the buffer's window should not be
-- selectable.
vim.g.nvim_tree_special_files = {} -- List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}
-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath.
-- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
-- but this will not work when you set indent_markers (because of UI conflict)
--  default will show icon by default if no icon is provided
--  default shows no icon by default
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌",
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  },
}

-- a list of groups can be found at `:help nvim_tree_highlight`
vim.cmd "highlight NvimTreeFolderIcon guibg=blue"

local tree_cb = require("nvim-tree.config").nvim_tree_callback
-- default mappings
vim.g.nvim_tree_bindings = {
  { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb "edit" },
  { key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb "cd" },
  { key = "<C-v>", cb = tree_cb "vsplit" },
  { key = "<C-x>", cb = tree_cb "split" },
  { key = "<C-t>", cb = tree_cb "tabnew" },
  { key = "<", cb = tree_cb "prev_sibling" },
  { key = ">", cb = tree_cb "next_sibling" },
  { key = "P", cb = tree_cb "parent_node" },
  { key = "<BS>", cb = tree_cb "close_node" },
  { key = "<S-CR>", cb = tree_cb "close_node" },
  { key = "<Tab>", cb = tree_cb "preview" },
  { key = "K", cb = tree_cb "first_sibling" },
  { key = "J", cb = tree_cb "last_sibling" },
  { key = "I", cb = tree_cb "toggle_ignored" },
  { key = "<C-h>", cb = tree_cb "toggle_dotfiles" },
  { key = "R", cb = tree_cb "refresh" },
  { key = "a", cb = tree_cb "create" },
  { key = "d", cb = tree_cb "remove" },
  { key = "r", cb = tree_cb "rename" },
  { key = "<C-r>", cb = tree_cb "full_rename" },
  { key = "x", cb = tree_cb "cut" },
  { key = "c", cb = tree_cb "copy" },
  { key = "p", cb = tree_cb "paste" },
  { key = "y", cb = tree_cb "copy_name" },
  { key = "Y", cb = tree_cb "copy_path" },
  { key = "gy", cb = tree_cb "copy_absolute_path" },
  { key = "[c", cb = tree_cb "prev_git_item" },
  { key = "]c", cb = tree_cb "next_git_item" },
  { key = "-", cb = tree_cb "dir_up" },
  { key = "s", cb = tree_cb "system_open" },
  { key = "q", cb = tree_cb "close" },
  { key = "g?", cb = tree_cb "toggle_help" },
}
