local custom = require 'custom'

-- Enable the build-in undotree plugin.
vim.cmd.packadd 'nvim.undotree'

-- Remove help information from the popup menu.
vim.cmd.aunmenu [[PopUp.How-to\ disable\ mouse]]
vim.cmd.aunmenu [[PopUp.-1-]]

-- Override LSP floating preview to have rounded borders.
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  ---@type vim.lsp.util.open_floating_preview.Opts
  local preview_opts = { border = custom.border, title_pos = 'center' }
  opts = vim.tbl_deep_extend('keep', opts, preview_opts)
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.diagnostic.config {
  virtual_text = {
    spacing = 4,
    prefix = '●',
    severity = vim.diagnostic.severity.ERROR,
  },
  float = {
    severity_sort = true,
    source = 'if_many',
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = custom.icons.diagnostic.error,
      [vim.diagnostic.severity.WARN] = custom.icons.diagnostic.warn,
      [vim.diagnostic.severity.HINT] = custom.icons.diagnostic.hint,
      [vim.diagnostic.severity.INFO] = custom.icons.diagnostic.info,
    },
  },
}

vim.lsp.inlay_hint.enable()
vim.lsp.inline_completion.enable()
vim.lsp.enable {
  'clangd',
  'lua_ls',
  'copilot',
  'jsonls',
  'pyright',
  'gopls',
  'vue_ls',
  'vtsls',
  'yamlls',
  'zls',
}
