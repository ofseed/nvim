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
          { " NeoVim ", hl = theme.head },
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
            tab.close_btn "",
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

    vim.keymap.set("n", "<M-1>", "<Cmd>1tabnext<CR>", { desc = "Go to tabpage 1" })
    vim.keymap.set("n", "<M-2>", "<Cmd>2tabnext<CR>", { desc = "Go to tabpage 2" })
    vim.keymap.set("n", "<M-3>", "<Cmd>3tabnext<CR>", { desc = "Go to tabpage 3" })
    vim.keymap.set("n", "<M-4>", "<Cmd>4tabnext<CR>", { desc = "Go to tabpage 4" })
    vim.keymap.set("n", "<M-5>", "<Cmd>5tabnext<CR>", { desc = "Go to tabpage 5" })
    vim.keymap.set("n", "<M-6>", "<Cmd>6tabnext<CR>", { desc = "Go to tabpage 6" })
    vim.keymap.set("n", "<M-7>", "<Cmd>7tabnext<CR>", { desc = "Go to tabpage 7" })
    vim.keymap.set("n", "<M-8>", "<Cmd>8tabnext<CR>", { desc = "Go to tabpage 8" })
    vim.keymap.set("n", "<M-9>", "<Cmd>9tabnext<CR>", { desc = "Go to tabpage 9" })
  end,
}
