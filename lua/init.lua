local custom = require "custom"

require "options"
require "misc"
require "keymaps"
require "autocmds"
require "lsp"
require "manager"

vim.cmd.colorscheme(custom.theme)
