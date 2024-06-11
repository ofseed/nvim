---@type LazyPluginSpec
return {
  "goolord/alpha-nvim",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"
    local theta = require "alpha.themes.theta"

    theta.header.val = {
      [[                                                     ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ]],
      [[                                                     ]],
    }

    theta.buttons.val = {
      {
        type = "text",
        val = "Quick links",
        opts = { hl = "SpecialComment", position = "center" },
      },
      { type = "padding", val = 1 },
      dashboard.button("e", "󰈔  New file", "<Cmd>ene<CR>"),
      dashboard.button("SPC f f", "󰈞  Find file"),
      dashboard.button("SPC f w", "󰊄  Live grep"),
      dashboard.button(
        "c",
        "  Configuration",
        "<Cmd>edit ~/.config/nvim<CR>"
      ),
      dashboard.button("u", "  Update plugins", "<Cmd>Lazy sync<CR>"),
      dashboard.button("q", "󰅚  Quit", "<Cmd>qa<CR>"),
    }

    return theta.config
  end,
}
