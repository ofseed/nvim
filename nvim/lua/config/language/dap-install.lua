local installer = require "dap-install"

installer.setup {
  installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
}
