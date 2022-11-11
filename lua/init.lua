-- Impatient.nvim is a plugin which improves startuptime of neovim,
-- by creating cache. If it does not exist, it will not affect normal use
local ok, impatient = pcall(require, "impatient")
if ok then
  impatient.enable_profile()
end

require "plugins"
require "keymaps"

-- For the use of impatient.nvim, packer_compiled.lua needs to be
-- in the lua/ directory instead of the default.
-- If it doesn't exist, it will be created by :PackerSync
local ok, packer_compiled = pcall(require, "packer_compiled")
if not ok then
  vim.cmd "PackerSync"
end

-- Load colorscheme after plugins are loaded
-- Only the configuration started the second time takes effect for the bufferline
vim.cmd "silent! colorscheme catppuccin"

-- set custom hilight after colorscheme is loaded
require "hilight"
