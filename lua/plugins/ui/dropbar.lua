local custom = require "custom"

return {
  "Bekaboo/dropbar.nvim",
  opts = {
    general = {
      enable = function(buf, win)
        return not vim.api.nvim_win_get_config(win).zindex
          and vim.bo[buf].buftype == ""
          and vim.api.nvim_buf_get_name(buf) ~= ""
          and not vim.wo[win].diff
          and vim.bo[buf].filetype ~= "toggleterm"
      end,
    },
    icons = {
      kinds = {
        symbols = custom.icons.kind_with_space,
      },
    },
    sources = {
      path = {
        modified = function(sym)
          return sym:merge {
            name = sym.name .. " [+]",
            name_hl = "DiffAdded",
          }
        end,
      },
    },
  },
}
