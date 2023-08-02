return {
  "mfussenegger/nvim-jdtls",
  event = {
    "BufRead *.java",
    "BufNewFile *.java",
  },
  config = function()
    local jdtls = require "jdtls"
    local mason = require "mason-registry"
    local capabilities = require "capabilities"

    local opts = {
      cmd = { mason.get_package("jdtls"):get_install_path() .. "/bin/jdtls" },
      handlers = {
        ["language/status"] = function() end,
      },
      settings = {
        java = {
          inlayHints = {
            parameterNames = {
              enabled = "all",
            },
          },
        },
      },
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        jdtls.setup_dap { hotcodereplace = "auto" }
        require("jdtls.setup").add_commands()
      end,
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

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      desc = "Attach jdtls",
      callback = function()
        jdtls.start_or_attach(opts)
        vim.bo.tabstop = 4
      end,
    })
  end,
}
