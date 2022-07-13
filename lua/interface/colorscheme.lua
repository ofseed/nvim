vim.g.tokyonight_transparent = 0
vim.g.tokyonight_day_brightness = 0.3
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_lualine_bold = 1
vim.g.tokyonight_sidebars = { "Outline", "packer", "aerial" }

vim.g.gruvbox_transparent_bg = 0
vim.g.gruvbox_underline = 0
vim.g.gruvbox_invert_selection = 0

vim.g.github_sidebars = { "Outline", "packer" }

vim.g.vscode_style = "dark"

local ok, nightfox = pcall(require, "nightfox")
if ok then
  nightfox.setup {
    styles = {
      comments = "italic",
    },
  }
end

local ok, catppuccin = pcall(require, "catppuccin")
if ok then
  catppuccin.setup {
    transparent_background = false,
    term_colors = false,
    styles = {
      comments = "italic",
      conditionals = "italic",
      loops = "NONE",
      functions = "NONE",
      keywords = "NONE",
      strings = "NONE",
      variables = "NONE",
      numbers = "NONE",
      booleans = "NONE",
      properties = "NONE",
      types = "NONE",
      operators = "NONE",
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = "italic",
          hints = "italic",
          warnings = "italic",
          information = "italic",
        },
        underlines = {
          errors = "underline",
          hints = "underline",
          warnings = "underline",
          information = "underline",
        },
      },
      coc_nvim = false,
      lsp_trouble = false,
      cmp = true,
      lsp_saga = false,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = true,
        transparent_panel = false,
      },
      neotree = {
        enabled = true,
        show_root = true,
        transparent_panel = false,
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      dashboard = true,
      neogit = true,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = true,
      hop = true,
      notify = true,
      telekasten = true,
      symbols_outline = true,
      mini = false,
    },
  }
  vim.g.catppuccin_flavour = "mocha"
end

vim.cmd "colorscheme catppuccin"
