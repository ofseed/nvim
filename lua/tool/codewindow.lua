local ok, codewindow = pcall(require, "codewindow")
if not ok then
  vim.notify "Could not load codewindow"
  return
end

codewindow.setup {
  minimap_width = 20, -- The width of the text part of the minimap
  width_multiplier = 4, -- How many characters one dot represents
  use_lsp = true, -- Use the builtin LSP to show errors and warnings
  use_treesitter = true, -- Use nvim-treesitter to highlight the code
  exclude_filetypes = {}, -- Choose certain filetypes to not show minimap on
  z_index = 1, -- The z-index the floating window will be on
  max_minimap_height = nil, -- The maximum height the minimap can take (including borders)
  active_in_terminals = false, -- Should the minimap activate for terminal buffers
}

codewindow.apply_default_keybinds()
