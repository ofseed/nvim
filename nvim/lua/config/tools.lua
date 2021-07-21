-- Telescope.nvim config
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
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
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- Telescope-project.nvim
require'telescope'.load_extension('project')

-- Nvim-autopairs config
require('nvim-autopairs').setup()

-- Nvim-ts-autotag config
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)

-- Lazygit.nvim config
-- setup mapping to call :LazyGit
vim.api.nvim_set_keymap('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true })

-- VimTeX config
vim.g.tex_flavor = 'latex'
vim.g.vimtex_quickfix_mode = 0
if vim.fn.has('unix') == 1 then
    vim.g.vimtex_view_general_viewer = 'zathura'
    vim.g.vimtex_view_method = 'zathura'
end
vim.g.vimtex_compiler_latexmk_engines = { _ = '-xelatex'}
vim.g.vimtex_compiler_latexrun_engines ={ _ = 'xelatex'}
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_toc_config = {
  name = 'TOC',
  layers = {'content', 'todo', 'include'},
  split_width = 25,
  todo_sorted = 0,
  show_help = 1,
  show_numbers = 1,
}

--[[
-- Indent-blankline config
vim.g.indent_blankline_use_treesitter = v:true
vim.g.indent_blankline_char_list = ['¦']
vim.g.indent_blankline_filetype_exclude = ['dashboard', 'nvimtree', 'txt', 'md']
]]--
