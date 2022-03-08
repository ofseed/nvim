local ok, installer = pcall(require, "dap-install")
if not ok then
  vim.notify "Could not load dap install"
  return
end

installer.setup {
  installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
}
