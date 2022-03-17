local ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify "Could not load telescope"
  return
end

local extensions = {
  "fzf",
  "hop",
  "file_browser",
  "project",
  "media_files",
  "notify",
  "ui-select",
  "dap",
}

-- Hot-reloaded function for telescope-hop
if pcall(require, "plenary") then
  RELOAD = require("plenary.reload").reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = " ",
    selection_caret = "➜ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    mappings = {
      i = {
        -- IMPORTANT
        -- either hot-reloaded or `function(prompt_bufnr) telescope.extensions.hop.hop end`
        ["<C-h>"] = R("telescope").extensions.hop.hop, -- hop.hop_toggle_selection
        -- custom hop loop to multi selects and sending selected entries to quickfix list
        ["<C-space>"] = function(prompt_bufnr)
          local opts = {
            callback = require("telescope.actions").toggle_selection,
            loop_callback = require("telescope.actions").send_selected_to_qflist,
          }
          require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
        end,
      },
    },

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    hop = {
      -- the shown `keys` are the defaults, no need to set `keys` if defaults work for you ;)
      -- keys = {
      --   "a", "s", "d", "f", "g", "h", "j", "k", "l", ";", "q", "w", "e", "r", "t", "y", "u", "i", "o", "p",
      --   "A", "S", "D", "F", "G", "H", "J", "K", "L", ":", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P",
      -- },
      -- Highlight groups to link to signs and lines; the below configuration refers to demo
      -- sign_hl typically only defines foreground to possibly be combined with line_hl
      -- sign_hl = { "WarningMsg", "Title" },
      -- optional, typically a table of two highlight groups that are alternated between
      -- line_hl = { "CursorLine", "Normal" },
      -- options specific to `hop_loop`
      -- true temporarily disables Telescope selection highlighting
      clear_selection_hl = false,
      -- highlight hopped to entry with telescope selection highlight
      -- note: mutually exclusive with `clear_selection_hl`
      trace_entry = true,
      -- jump to entry where hoop loop was started from
      reset_selection = true,
    },
    file_browser = {
      theme = "ivy",
    },
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "jpg", "mp4", "webm" },
      find_cwd = "rg",
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      },
    },
  },
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:

for i = 1, #extensions do
  telescope.load_extension(extensions[i])
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  "<cmd>lua require'telescope.builtin'.find_files()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  "<cmd>lua require'telescope.builtin'.live_grep()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>f?",
  "<cmd>lua require'telescope.builtin'.help_tags()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fh",
  "<cmd>lua require'telescope.builtin'.oldfiles()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  "<cmd>lua require'telescope.builtin'.marks()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<space>fe",
  "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fp",
  "<cmd>lua require'telescope'.extensions.project.project{}<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fr",
  "<cmd>lua require'telescope'.extensions.frecency.frecency()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fm",
  "<cmd>lua require'telescope'.extensions.media_files.media_files()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fn",
  "<cmd>lua require'telescope'.extensions.notify.notify()<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>fde",
  "<cmd>lua require'telescope'.extensions.dap.commands()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fdc",
  "<cmd>lua require'telescope'.extensions.dap.configurations()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fdb",
  "<cmd>lua require'telescope'.extensions.dap.list_breakpoints()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fdv",
  "<cmd>lua require'telescope'.extensions.dap.variables()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fdf",
  "<cmd>lua require'telescope'.extensions.dap.frames()<CR>",
  { noremap = true, silent = true }
)
