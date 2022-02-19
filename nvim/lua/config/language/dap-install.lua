local ok, installer = pcall(require, "dap-install")
if not ok then
  return
end

installer.setup {
  installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
}
