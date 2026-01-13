---@type LazyPluginSpec
return {
  'ghostbuster91/nvim-next',
  enabled = false,
  opts = function()
    local builtins = require 'nvim-next.builtins'

    return {
      default_mappings = {
        repeat_style = 'original',
      },
      items = {
        builtins.f,
        builtins.t,
      },
    }
  end,
  keys = function()
    local integrations = require 'nvim-next.integrations'
    local diag = integrations.diagnostic()
    local qf = integrations.quickfix()

    return {
      -- Diagnostic
      { '[d', diag.goto_prev(), desc = 'Previous diagnostic' },
      { ']d', diag.goto_next(), desc = 'Next diagnostic' },

      -- Quickfix
      { '[q', qf.cprevious, desc = 'Previous quickfix item' },
      { ']q', qf.cnext, desc = 'Next quickfix item' },
    }
  end,
}
