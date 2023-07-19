local config = function()

local jdtls = require "jdtls"

local mason = require "mason-registry"

local default = require "default"

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local opts = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = { mason.get_package("jdtls"):get_install_path() .. "/bin/jdtls" },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" },

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      inlayHints = {
        parameterNames = {
          enabled = "all",
        },
      },
    },
  },

  capabilities = default.capabilities,

  on_attach = function(client, bufnr)
    default.on_attach(client, bufnr)
    -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
    -- you make during a debug session immediately.
    -- Remove the option if you do not want that.
    -- You can use the `JdtHotcodeReplace` command to trigger it manually
    jdtls.setup_dap { hotcodereplace = "auto" }
    require("jdtls.setup").add_commands()
  end,

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {
      vim.fn.glob(
        mason.get_package("java-debug-adapter"):get_install_path()
          .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
        1
      ),
    },
  },
}

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "java",
  callback = function()
    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    jdtls.start_or_attach(opts)
    vim.bo.tabstop = 4
  end,
})

end

return {
  "mfussenegger/nvim-jdtls",
  config = config,
}
