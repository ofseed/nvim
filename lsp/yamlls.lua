---@type vim.lsp.Config
return {
  root_dir = function(bufnr, on_dir)
    -- Ignore github actions workflow files, which are supported by gh_actions_ls.
    local parent = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
    if
      vim.endswith(parent, '/.github/workflows')
      or vim.endswith(parent, '/.forgejo/workflows')
      or vim.endswith(parent, '/.gitea/workflows')
    then
      return
    end

    on_dir(parent)
  end,
}
