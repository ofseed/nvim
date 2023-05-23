local ok, typescript = pcall(require, "typescript")
if not ok then
  vim.notify "Could not load typescript"
  return
end

local default = require "language.default"

typescript.setup {
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  server = { -- pass options to lspconfig's setup method
    capabilities = default.capabilities,
    on_attach = function(client, bufnr)

      client.server_capabilities.documentFormattingProvider = false

      default.on_attach(client, bufnr)
      vim.keymap.set(
        "n",
        "<localleader>i",
        typescript.actions.addMissingImports,
        { buffer = bufnr, desc = "Add missing imports" }
      )
      vim.keymap.set(
        "n",
        "<localleader>o",
        typescript.actions.organizeImports,
        { buffer = bufnr, desc = "Organize imports" }
      )
      vim.keymap.set(
        "n",
        "<localleader>r",
        typescript.actions.removeUnused,
        { buffer = bufnr, desc = "Remove unused variables" }
      )
      vim.keymap.set("n", "<localleader>f", typescript.actions.fixAll, { buffer = bufnr, desc = "Fix all" })
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
