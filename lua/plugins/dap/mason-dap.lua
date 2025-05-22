---@type LazyPluginSpec
return {
  "jay-babu/mason-nvim-dap.nvim",
  -- Only load when nvim-dap loads
  lazy = true,
  dependencies = {
    "mason.nvim",
  },
  opts = function()
    return {
      handlers = {
        js = function(config)
          config.name = "pwa-node"
          config.filetypes = { "javascript" }
          require("mason-nvim-dap").default_setup(config)
        end,

        -- Ignored adapters
        python = function() end,
        delve = function() end,
      },
    }
  end,
}
