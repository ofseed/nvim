local locals = require "locals"

return {
  "github/copilot.vim",
  event = "VeryLazy",
  cond = not locals.disable_copilot,
  init = function()
    vim.g.copilot_no_tab_map = true
  end,
  config = function()
    vim.g.copilot_filetypes = {
      registers = 0,
      markdown = 1,
    }

    vim.keymap.set(
      "i",
      "<C-J>",
      'copilot#Accept("<CR>")',
      { silent = true, script = true, expr = true, replace_keycodes = false }
    )
    vim.keymap.set("i", "<M-NL>", "<Cmd>Copilot<CR>")
  end,
}
