local ok, ls = pcall(require, "null-ls")
if not ok then
  vim.notify "Could not load null-ls"
  return
end

ls.setup {
  sources = {
    ls.builtins.formatting.prettier,
    ls.builtins.formatting.stylua,
    ls.builtins.formatting.black,
    -- ls.builtins.diagnostics.pylint,
    -- ls.builtins.diagnostics.codespell,
  },
}
