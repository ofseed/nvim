local vim = vim

-- Nvim-Treesitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incrementnl = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = false
  }
}

-- Nvim-compe config
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm(luaeval(\"require 'nvim-autopairs'.autopairs_cr()\"))", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", { silent = true, expr = true })

-- Vim-vsnip config
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- NOTE: You can use other key to expand snippet.

-- Expand
vim.api.nvim_set_keymap("i", "<C-j>", "vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'", { expr = true })
vim.api.nvim_set_keymap("s", "<C-j>", "vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'", { expr = true })

-- Expand or jump
vim.api.nvim_set_keymap("i", "<C-l>", "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { expr = true })
vim.api.nvim_set_keymap("s", "<C-l>", "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'", { expr = true })

-- Jump forward or backward
--[[
vim.api.nvim_set_keymap("i", "<Tab>", "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", { expr = true })
]]--

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
--[[
vim.api.nvim_set_keymap("n", "s", "<Plug>(vsnip-select-text)", { expr = true })
vim.api.nvim_set_keymap("x", "s", "<Plug>(vsnip-select-text)", { expr = true })
vim.api.nvim_set_keymap("n", "s", "<Plug>(vsnip-cut-text)", { expr = true })
vim.api.nvim_set_keymap("x", "s", "<Plug>(vsnip-cut-text)", { expr = true })
]]--

-- If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.

-- Neoformat config
vim.api.nvim_set_keymap('n', '<leader>F', ':Neoformat<CR>', { noremap = true, silent = true })

-- Nvim-Lsp config
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{
      capabilities = capabilities;
      on_attach = on_attach,
    }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

