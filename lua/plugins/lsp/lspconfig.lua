local custom = require "custom"

---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  event = {
    "Filetype",
  },
  dependencies = {
    "folke/neoconf.nvim",
  },
  config = function()
    require("lspconfig.ui.windows").default_options.border = custom.border
    local lspconfig = require "lspconfig"
    local capabilities = require "capabilities"

    lspconfig.nixd.setup {
      settings = {
        nixd = {
          nixpkgs = {
            expr = 'import (builtins.getFlake "/home/ofseed/.config/home-manager").inputs.nixpkgs {  }',
          },
          options = {
            home_manager = {
              expr = '(builtins.getFlake "/home/ofseed/.config/home-manager").homeConfigurations.ofseed.options',
            },
          },
        },
      },
    }

    lspconfig.pyright.setup {
      cmd = { "delance-langserver", "--stdio" },
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
            inlayHints = {
              callArgumentNames = "partial",
              functionReturnTypes = true,
              pytestParameters = true,
              variableTypes = true,
            },
          },
        },
      },
    }

    -- Needed by clangd
    capabilities = vim.tbl_extend("force", capabilities, {
      offsetEncoding = "utf-16",
    })

    lspconfig.clangd.setup {
      cmd = { "clangd", "--header-insertion-decorators=0" },
      capabilities = capabilities,
    }
  end,
  keys = {
    {
      "<leader>lR",
      function()
        vim.cmd.LspRestart()
      end,
      desc = "Reload",
    },
    {
      "<leader>lI",
      function()
        vim.cmd.LspInfo()
      end,
      desc = "Info",
    },
  },
}
