local library = vim.api.nvim_get_runtime_file('lua', true)

for _, plugin in ipairs(require('lazy').plugins()) do
  local path = vim.fs.joinpath(plugin.dir, 'lua')
  if vim.fn.isdirectory(path) == 1 and not vim.tbl_contains(library, path) then
    library[#library + 1] = path
  end
end

vim.lsp.config('emmylua_ls', {
  settings = {
    emmylua = {
      workspace = {
        library = library,
      },
    },
  },
})
