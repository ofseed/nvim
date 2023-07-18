local config = function()

local telescope = require "telescope"

local extensions = {
  "fzf",
  "live_grep_args",
  "hop",
  "project",
  "media_files",
  "notify",
  "dap",
  "luasnip",
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
  pickers = {
    find_files = {
      theme = "ivy",
    },
    oldfiles = {
      theme = "ivy",
    },
    live_grep = {
      theme = "dropdown",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    live_grep_args = {
      theme = "dropdown",
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
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "jpg", "mp4", "webm" },
      find_cwd = "rg",
    },
  },
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:

for i = 1, #extensions do
  telescope.load_extension(extensions[i])
end

end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    { "nvim-telescope/telescope-hop.nvim" },
    { "nvim-telescope/telescope-project.nvim" },
    { "nvim-telescope/telescope-media-files.nvim" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "benfowler/telescope-luasnip.nvim" },
  },
  config = config,
  keys = {
    { "<leader>ff", function () require("telescope.builtin").find_files() end, { desc = "Find files" } },
    { "<leader>f?", function () require("telescope.builtin").help_tags() end, { desc = "Help tags" } },
    { "<leader>fh", function () require("telescope.builtin").oldfiles() end, { desc = "Old files" } },
    { "<leader>fb", function () require("telescope.builtin").marks() end, { desc = "Marks" } },
    { "<leader>fs", function () require("telescope.builtin").lsp_document_symbols() end, { desc = "Symbols" } },
    { "<leader>fS", function () require("telescope.builtin").lsp_workspace_symbols() end, { desc = "Symbols" } },
    { "<leader>fc", function () require("telescope.builtin").colorscheme() end, { desc = "Colorscheme" } },
    { "<leader>fg", function () require("telescope").extensions.live_grep_args.live_grep_args() end, { desc = "Live grep" } },
    { "<leader>fp", function () require("telescope").extensions.project.project() end, { desc = "Project" } },
    { "<leader>fm", function () require("telescope").extensions.media_files.media_files() end, { desc = "Media files" } },
    { "<leader>fn", function () require("telescope").extensions.notify.notify() end, { desc = "Notify" } },
    { "<leader>fde", function () require("telescope").extensions.dap.commands() end, { desc = "Commands" } },
    { "<leader>fdc", function () require("telescope").extensions.dap.configurations() end, { desc = "Configurations" } },
    { "<leader>fdb", function () require("telescope").extensions.dap.list_breakpoints() end, { desc = "Breakpoints" } },
    { "<leader>fdv", function () require("telescope").extensions.dap.variables() end, { desc = "Variables" } },
    { "<leader>fdf", function () require("telescope").extensions.dap.frames() end, { desc = "Frames" } },
  }
}
