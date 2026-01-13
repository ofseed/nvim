local api = vim.api
local keymap = vim.keymap
local lsp = vim.lsp

local bufnr = api.nvim_get_current_buf()

-- For tab-based indentation.
vim.bo[bufnr].tabstop = 4
vim.bo[bufnr].shiftwidth = 4
vim.bo[bufnr].expandtab = false

api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP Attach for Go',
  buffer = bufnr,
  callback = function(args)
    local client = assert(lsp.get_client_by_id(args.data.client_id))
    if client.name == 'gopls' then
      -- Since `keywordprg` is customized for Go,
      -- the default `K` mapping won't work, so we set it up here.
      keymap.set('n', 'K', function()
        lsp.buf.hover()
      end, { buffer = bufnr, desc = 'Hover' })
    end
  end,
})
