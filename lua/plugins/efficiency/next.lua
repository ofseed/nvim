---@type LazyPluginSpec
return {
  "ghostbuster91/nvim-next",
  event = "VeryLazy",
  opts = function()
    local builtins = require "nvim-next.builtins"

    return {
      default_mappings = {
        repeat_style = "original",
      },
      items = {
        builtins.f,
        builtins.t,
      },
    }
  end,
  config = function(_, opts)
    local next = require "nvim-next"
    local integrations = require "nvim-next.integrations"

    next.setup(opts)

    -- Diagnostic
    local diag = integrations.diagnostic()
    vim.keymap.set("n", "[d", diag.goto_prev(), { desc = "Previous diagnostic" })
    vim.keymap.set("n", "]d", diag.goto_next(), { desc = "Next diagnostic" })

    -- Quickfix
    local nqf = integrations.quickfix()
    vim.keymap.set("n", "[q", nqf.cprevious, { desc = "Previous quickfix item" })
    vim.keymap.set("n", "]q", nqf.cnext, { desc = "Next quickfix item" })
  end,
}
