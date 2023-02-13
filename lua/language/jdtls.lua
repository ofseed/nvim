local ok, jdtls = pcall(require, "jdtls")
if not ok then
  vim.notify "Could not load jdtls"
  return
end

local ok, mason = pcall(require, "mason-registry")
if not ok then
  vim.notify "Could not load mason-registry"
  return
end

local config = {
  cmd = { mason.get_package("jdtls"):get_install_path() .. "/bin/jdtls" },
  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" },
}

jdtls.start_or_attach(config)
