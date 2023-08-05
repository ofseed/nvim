local custom = require "custom"

return {
  "nanozuki/tabby.nvim",
  cond = custom.prefer_tabpage,
  init = function()
    vim.o.showtabline = 2
  end,
  config = function()
    local theme = {
      head = "TabLine",

      current_tab = "TabLineSel",
      inactive_tab = "TabLine",

      fill = "TabLineFill",

      win = "TabLine",

      tail = "TabLine",
    }

    require("tabby.tabline").set(function(line)
      return {
        -- Head
        {
          { "  ", hl = theme.head },
          line.sep("", theme.head, theme.fill),
        },

        -- Tabs
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.inactive_tab
          return {
            line.sep("", hl, theme.fill),
            tab.is_current() and "" or "󰆣",
            tab.number(),
            tab.name(),
            tab.close_btn "",
            line.sep("", hl, theme.fill),
            hl = hl,
            margin = " ",
          }
        end),

        -- Fill Space
        line.spacer(),

        -- Windows
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
          return {
            line.sep("", theme.win, theme.fill),
            win.is_current() and "" or "",
            win.buf_name(),
            line.sep("", theme.win, theme.fill),
            hl = theme.win,
            margin = " ",
          }
        end),

        -- Tail
        {
          line.sep("", theme.tail, theme.fill),
          { "  ", hl = theme.tail },
        },
        hl = theme.fill,
      }
    end)
  end,
}
