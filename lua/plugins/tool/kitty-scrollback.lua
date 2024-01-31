return {
  "mikesmithgh/kitty-scrollback.nvim",
  cmd = {
    "KittyScrollbackGenerateKittens",
    "KittyScrollbackCheckHealth",
  },
  event = { "User KittyScrollbackLaunch" },
  opts = {
    {
      paste_window = {
        winopts_overrides = function(winopts)
          winopts.border = {
            "╭",
            "─",
            "╮",
            "│",
            "┤",
            "─",
            "├",
            "│",
          }
          return winopts
        end,
        footer_winopts_overrides = function(winopts)
          winopts.border = {
            "│",
            " ",
            "│",
            "│",
            "╯",
            "─",
            "╰",
            "│",
          }
          return winopts
        end,
      },
    },
  },
}
