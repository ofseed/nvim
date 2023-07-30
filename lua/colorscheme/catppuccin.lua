return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  opts = {
    term_colors = true,
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
      neogit = true,
      noice = true,
      notify = true,
      octo = true,
      overseer = true,
      symbols_outline = true,
      illuminate = true,
      which_key = true,
    },
  },
}
