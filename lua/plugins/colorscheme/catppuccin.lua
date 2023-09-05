return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  opts = {
    term_colors = true,
    custom_highlights = function(color)
      return {
        TabLine = { bg = color.surface0, fg = color.subtext0 },
        TabLineFill = { fg = color.subtext0, bg = color.mantle },
        TabLineSel = { fg = color.base, bg = color.overlay1 },

        MatchParen = { fg = "NONE", bg = color.surface1, style = { "bold" } },
      }
    end,
    integrations = {
      aerial = true,
      fidget = true,
      markdown = true,
      mason = true,
      neotree = true,
      native_lsp = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      navic = {
        enabled = true,
      },
      noice = true,
      notify = true,
      treesitter_context = true,
      octo = true,
      overseer = true,
      symbols_outline = true,
      illuminate = true,
      which_key = true,
    },
  },
}
