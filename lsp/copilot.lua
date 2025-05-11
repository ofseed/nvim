return {
  cmd = {
    "./node_modules/@github/copilot-language-server/native/linux-x64/copilot-language-server",
    "--stdio",
  },
  filetypes = { "javascript" },
  init_options = {
    editorInfo = {
      name = "Neovim",
      version = tostring(vim.version()),
    },
    editorPluginInfo = {
      name = "Neovim",
      version = tostring(vim.version()),
    },
  },
  settings = {
    telemetry = {
      telemetryLevel = "all",
    },
  },
  on_attach = function(client, bufnr)
    vim.keymap.set("n", "<M-i>", function()
      client:request(
        ---@diagnostic disable-next-line: param-type-mismatch
        "signIn",
        -- HACK: Error when passing empty params
        { field = "placeholder" },
        function(err, result)
          if err then
            vim.notify(vim.inspect(err), vim.log.levels.ERROR)
            return
          end
          if result.command then
            local command = result.command
            local code = result.userCode
            vim.fn.setreg("+", code)
            vim.fn.setreg("*", code)
            client:exec_cmd(
              command,
              { bufnr = bufnr },
              function(cmd_err, cmd_result)
                if cmd_err then
                  vim.print(cmd_err)
                  return
                end
                vim.print(cmd_result)
              end
            )
          end
          vim.print(result)
        end
      )
    end, { buffer = bufnr, desc = "Sign In" })
    vim.keymap.set("n", "<M-o>", function()
      client:request(
        ---@diagnostic disable-next-line: param-type-mismatch
        -- HACK: Error when passing empty params
        "signOut",
        {
          field = "placehoder",
        },
        function(err, result)
          if err then
            vim.notify(vim.inspect(err), vim.log.levels.ERROR)
            return
          end
          vim.print(result)
        end
      )
    end, { buffer = bufnr, desc = "Sign Out" })
    vim.keymap.set("n", "<M-CR>", function()
      vim.lsp.inline_completion.trigger()
    end, { desc = "Trigger or accept completion", buffer = bufnr })
    vim.keymap.set("n", "<M-j>", function()
      vim.lsp.inline_completion.jump { count = 1 }
    end, { desc = "Next completion", buffer = bufnr })
    vim.keymap.set("n", "<M-k>", function()
      vim.lsp.inline_completion.jump { count = -1 }
    end, { desc = "Previous completion", buffer = bufnr })
  end,
}
