local api = vim.api
local keymap = vim.keymap
local lsp = vim.lsp

local augroup = api.nvim_create_augroup('ofseed', {})

api.nvim_create_autocmd('FileType', {
  desc = 'Enable treesitter-based features for supported filetypes',
  callback = function(args)
    local bufnr = args.buf
    local filetype = args.match
    local lang = vim.treesitter.language.get_lang(filetype)
    if lang and vim.treesitter.language.add(lang) then
      -- Highlighting
      vim.treesitter.start(bufnr, lang)
      -- Folds
      vim.wo[0][0].foldmethod = 'expr'
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      -- Indentation
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
  group = augroup,
})

api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable LSP-based folding if supported',
  callback = function(args)
    local bufnr = args.buf
    local client = assert(lsp.get_client_by_id(args.data.client_id))

    -- Enable LSP-based folding if supported.
    if client:supports_method('textDocument/foldingRange', bufnr) then
      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'v:lua.vim.lsp.foldexpr()'
      vim.o.foldtext = 'v:lua.vim.lsp.foldtext()'
    end
  end,
  group = augroup,
})

api.nvim_create_autocmd('LspAttach', {
  desc = 'Setup LSP keymaps',
  callback = function(args)
    local bufnr = args.buf

    -- Not be merged to upstream yet.
    if lsp.document_highlight then
      keymap.set('n', '<leader>ld', function()
        lsp.document_highlight.enable(
          not lsp.document_highlight.is_enabled { bufnr = 0 },
          { bufnr = bufnr }
        )
      end, { buffer = bufnr, desc = 'Toggle document highlight' })
      keymap.set('n', ']r', function()
        lsp.document_highlight.jump { count = vim.v.count1, refresh = true }
      end, { buffer = bufnr, desc = 'Next reference' })
      keymap.set('n', '[r', function()
        lsp.document_highlight.jump { count = -vim.v.count1, refresh = true }
      end, { buffer = bufnr, desc = 'Previous reference' })
    end

    -- Override default keymap for additional options
    keymap.set('n', 'grr', function()
      lsp.buf.references { includeDeclaration = false }
    end, { buffer = bufnr, desc = 'References' })

    -- Setup additional keymaps
    keymap.set('n', 'gd', lsp.buf.definition, { buffer = bufnr, desc = 'Definition' })
    keymap.set('n', 'gD', lsp.buf.type_definition, { buffer = bufnr, desc = 'Type definition' })
    keymap.set('n', 'gI', lsp.buf.implementation, { buffer = bufnr, desc = 'Implementation' })
    keymap.set(
      { 'i', 's' },
      '<C-S>',
      lsp.buf.signature_help,
      { buffer = bufnr, desc = 'Signature help' }
    )
    keymap.set('i', '<C-J>', function()
      if not lsp.inline_completion.get() then
        return '<C-J>'
      end
    end, { expr = true, desc = 'Accept the current inline completion', buffer = bufnr })
    keymap.set(
      'n',
      '<leader>li',
      lsp.buf.incoming_calls,
      { buffer = bufnr, desc = 'Incoming calls' }
    )
    keymap.set(
      'n',
      '<leader>lo',
      lsp.buf.outgoing_calls,
      { buffer = bufnr, desc = 'Outgoing calls' }
    )
    keymap.set('n', '<leader>lh', function()
      lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled { bufnr = bufnr }, { bufnr = bufnr })
    end, { buffer = bufnr, desc = 'Toggle inlay hints' })
    keymap.set('n', '<leader>lR', function()
      vim.cmd.lsp('restart')
    end, { buffer = bufnr, desc = 'Reload LSP' })
    keymap.set('n', '<leader>lI', function()
      vim.cmd.checkhealth('lsp')
    end, { buffer = bufnr, desc = 'LSP info' })
    keymap.set(
      'n',
      '<leader>lwa',
      lsp.buf.add_workspace_folder,
      { buffer = bufnr, desc = 'Add workspace folder' }
    )
    keymap.set(
      'n',
      '<leader>lwr',
      lsp.buf.remove_workspace_folder,
      { buffer = bufnr, desc = 'Remove workspace folder' }
    )
    keymap.set('n', '<leader>lwl', function()
      print(vim.inspect(lsp.buf.list_workspace_folders()))
    end, { buffer = bufnr, desc = 'List workspace folders' })
  end,
  group = augroup,
})

api.nvim_create_autocmd('LspNotify', {
  desc = 'Auto close imports',
  callback = function(args)
    if args.data.method == 'textDocument/didOpen' then
      lsp.foldclose('imports', vim.fn.bufwinid(args.buf))
    end
  end,
  group = augroup,
})

api.nvim_create_autocmd('LspAttach', {
  desc = 'Sync working directory with LSP root',
  callback = function(args)
    local bufnr = args.buf
    local clients = lsp.get_clients({ bufnr = bufnr })

    -- Collect unique root dirs from all attached LSP clients.
    local root_dirs = {} ---@type table<string, true?>
    for _, client in ipairs(clients) do
      local root_dir = client.config.root_dir
      if root_dir then
        root_dirs[root_dir] = true
      end
    end
    local paths = vim.tbl_keys(root_dirs) ---@type string[]
    if #paths == 0 then
      return
    end

    -- Find the longest common prefix of all root dirs.
    local path = paths[1]
    local len = #path
    for i = 2, #paths do
      local current_path = paths[i]
      local current_len = #current_path
      if current_len < len then
        len = current_len
      end
      for j = 1, len do
        if path:byte(j) ~= current_path:byte(j) then
          len = j - 1
          break
        end
      end
    end
    path = path:sub(1, len)

    -- Avoid trigger `DirChanged` if the path is unchanged.
    if path == vim.fn.getcwd() then
      return
    end

    -- Set the working directory with appropriate scope.
    local tabpage = api.nvim_get_current_tabpage()
    local tabpages = api.nvim_list_tabpages()
    local winids = api.nvim_tabpage_list_wins(tabpage)
    winids = vim --- @type integer[]
      .iter(winids)
      ---@param winid integer
      :filter(function(winid)
        local buf = api.nvim_win_get_buf(winid)
        return vim.bo[buf].buftype == ''
      end)
      :totable()
    if #winids == 1 then
      if #tabpages == 1 then
        vim.cmd.cd(path)
      else
        vim.cmd.tcd(path)
      end
    elseif #winids > 1 then
      vim.cmd.lcd(path)
    end
  end,
})

api.nvim_create_autocmd('BufRead', {
  desc = 'Restore last cursor position',
  callback = function(args)
    local bufnr = args.buf
    local winid = api.nvim_get_current_win()
    local line, col = unpack(api.nvim_buf_get_mark(bufnr, '"'))

    -- Avoid setting cursor outside of the buffer.
    local end_line = api.nvim_buf_line_count(bufnr)
    local end_col = #api.nvim_buf_get_lines(bufnr, end_line - 1, end_line, true)[1]
    if line < end_line or (line == end_line and col <= end_col) then
      return
    end

    api.nvim_win_set_cursor(winid, { line, col })
  end,
  group = augroup,
})

api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold' }, {
  desc = 'Reload buffer on focus',
  callback = function()
    if vim.fn.getcmdwintype() == '' then
      vim.cmd 'checktime'
    end
  end,
  group = augroup,
})

api.nvim_create_autocmd('TextYankPost', {
  desc = 'Briefly highlight yanked text',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = augroup,
})

api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = 'Enable foldcolumn for normal files',
  callback = function()
    if vim.bo.buftype == '' then
      vim.wo.foldcolumn = '1'
    else
      vim.wo.foldcolumn = '0'
    end
  end,
  group = augroup,
})

api.nvim_create_autocmd('OptionSet', {
  desc = 'Enable foldcolumn for normal files',
  pattern = 'buftype',
  callback = function()
    if vim.bo.buftype == '' then
      vim.wo.foldcolumn = '1'
    else
      vim.wo.foldcolumn = '0'
    end
  end,
  group = augroup,
})

api.nvim_create_autocmd({ 'OptionSet' }, {
  desc = "Set 'breakindentopt' based on indent settings",
  pattern = { 'expandtab', 'shiftwidth', 'tabstop' },
  callback = function(args)
    if vim.tbl_contains({ 'text', 'markdown', 'org' }, vim.bo[args.buf].filetype) then
      return
    end

    -- The scope should match how 'shiftwidth' and 'tabstop' are set.
    local scope = vim.v.option_type
    local indent ---@type number
    if api.nvim_get_option_value('expandtab', { scope = scope }) then
      indent = api.nvim_get_option_value('shiftwidth', { scope = scope })
    else
      indent = api.nvim_get_option_value('tabstop', { scope = scope })
    end

    api.nvim_set_option_value('breakindentopt', 'shift:' .. indent, { scope = scope })
  end,
  group = augroup,
})
