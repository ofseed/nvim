local ok, impatient = pcall(require, "impatient")
if ok then
  impatient.enable_profile()
end

require "plugins"
require "keymaps"

local ok, packer_compiled = pcall(require, "packer_compiled")
if not ok then
  vim.cmd "PackerSync"
end
