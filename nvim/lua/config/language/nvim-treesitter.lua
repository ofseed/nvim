local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = "maintained",
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incrementnl = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = false
  },
  refactor = {
    smart_rename = {
      enable = true;
      keymaps = {
          smart_rename = "grr"
      }
    }
  },
  autotag = {
    enable = true
  }
}
