local default = require "default"

local opts = {
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  server = { -- pass options to lspconfig's setup method
    capabilities = default.capabilities,
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false

      default.on_attach(client, bufnr)
      vim.keymap.set("n", "<localleader>i", function()
        require("typescript").actions.addMissingImports()
      end, { buffer = bufnr, desc = "Add missing imports" })
      vim.keymap.set("n", "<localleader>o", function()
        require("typescript").actions.organizeImports()
      end, { buffer = bufnr, desc = "Organize imports" })
      vim.keymap.set("n", "<localleader>r", function()
        require("typescript").actions.removeUnused()
      end, { buffer = bufnr, desc = "Remove unused variables" })
      vim.keymap.set("n", "<localleader>f", function()
        require("typescript").actions.fixAll()
      end, { buffer = bufnr, desc = "Fix all" })
    end,
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
}

return {
  "jose-elias-alvarez/typescript.nvim",
  event = "BufRead *.js,*jsx,*ts,*tsx",
  opts = opts,
}
