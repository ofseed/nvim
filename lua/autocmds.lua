local api = vim.api

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
