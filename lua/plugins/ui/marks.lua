local opts = {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions.
  -- higher values will have better performance but may cause visual lag,
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower = 10, upper = 15, builtin = 5, bookmark = 20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {
    "",
    "lazy",
    "null-ls-info",
    "lspinfo",
    "NvimTree",
    "Outline",
    "notify",
    "noice",
    "neo-tree",
    "neo-tree-popup",
    "DressingInput",
    "NeogitCommitMessage",
    "NeogitNotification",
    "NeogitStatus",
    "registers",
    "dropbar_menu",
    "toggleterm",
    "OverseerForm",
    "oil_preview",
    "dap_rapl",
    "dapui_scopes",
    "dapui_breakpoints",
    "dapui_stacks",
    "dapui_watches",
    "dapui_console",
  },
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
    annotate = false,
  },
  mappings = {},
}

return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = opts,
}
