---@type LazyPluginSpec
return {
  "ghostbuster91/nvim-next",
  event = "VeryLazy",
  config = function()
    local next = require "nvim-next"
    local builtins = require "nvim-next.builtins"
    local integrations = require "nvim-next.integrations"

    next.setup {
      default_mappings = {
        repeat_style = "original",
      },
      items = {
        builtins.f,
        builtins.t,
      },
    }

    -- Diagnostic
    local diag = integrations.diagnostic()
    vim.keymap.set(
      "n",
      "[d",
      diag.goto_prev(),
      { desc = "Previous diagnostic" }
    )
    vim.keymap.set(
      "n",
      "]d",
      diag.goto_next(),
      { desc = "Next diagnostic" }
    )

    -- Quickfix
    local nqf = integrations.quickfix()
    vim.keymap.set("n", "[q", nqf.cprevious, { desc = "Previous quickfix item" })
    vim.keymap.set("n", "]q", nqf.cnext, { desc = "Next quickfix item" })
  end,
}
