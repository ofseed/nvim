local ok, ls = pcall(require, "null-ls")
if not ok then
  return
end

ls.setup {
  sources = {
    ls.builtins.formatting.prettier,
    ls.builtins.formatting.stylua,
    ls.builtins.formatting.autopep8,
    -- ls.builtins.diagnostics.codespell,
  },
}
