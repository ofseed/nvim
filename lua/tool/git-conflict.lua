local ok, conflict = pcall(require, "git-conflict")
if not ok then
  vim.notify "Could not load git-conflict"
end

conflict.setup {
  default_mappings = true, -- disable buffer local mapping created by this plugin
  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = "DiffText",
    current = "DiffAdd",
  },
}
