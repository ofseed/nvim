---@type LazyPluginSpec
return {
  'willothy/flatten.nvim',
  opts = function()
    local flatten = require 'flatten'

    ---@type Flatten.PartialConfig
    return {
      window = {
        open = 'alternate',
      },
      hooks = {
        should_nest = function(host)
          return flatten.hooks.should_nest(host) or vim.env.HEADLESS_OSV
        end,
      },
    }
  end,
}
