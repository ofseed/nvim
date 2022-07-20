local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  vim.notify "Could not load gitsigns"
  return
end

gitsigns.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
  on_attach = function(bufnr)
    -- Navigation
    vim.keymap.set("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gitsigns.next_hunk()
      end)
      return "<Ignore>"
    end, { buffer = bufnr, expr = true, desc = "Change" })

    vim.keymap.set("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gitsigns.prev_hunk()
      end)
      return "<Ignore>"
    end, { buffer = bufnr, expr = true, desc = "Change" })

    -- Actions
    vim.keymap.set({ "n", "v" }, "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { buffer = bufnr, desc = "Stage hunk" })
    vim.keymap.set({ "n", "v" }, "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { buffer = bufnr, desc = "Reset hunk" })
    vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk, { buffer = bufnr, desc = "Undo stage hunk" })
    vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
    vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })
    vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
    vim.keymap.set("n", "<leader>gb", function()
      gitsigns.blame_line { full = true }
    end, { buffer = bufnr, desc = "Blame line" })

    vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted, { buffer = bufnr, desc = "Deleted" })
    vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = "Line Blame" })

    -- Text object
    vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    vim.keymap.set({ "o", "x" }, "ah", ":<C-U>Gitsigns select_hunk<CR>")
  end,
}
