local opts = {
  inlay_hints = {
    parameter_hints = {
      show = true,
    },
    type_hints = {
      show = true,
    },
    label_formatter = function(tbl, kind, opts, client_name)
      if kind == 2 and not opts.parameter_hints.show then
        return ""
      elseif not opts.type_hints.show then
        return ""
      end

      return table.concat(tbl, ", ")
    end,
    virt_text_formatter = function(label, hint, opts, client_name)
      if client_name == "sumneko_lua" or client_name == "lua_ls" then
        if hint.kind == 2 then
          hint.paddingLeft = false
        else
          hint.paddingRight = false
        end
      end

      local vt = {}
      vt[#vt + 1] = hint.paddingLeft and { " ", "None" } or nil
      vt[#vt + 1] = { label, opts.highlight }
      vt[#vt + 1] = hint.paddingRight and { " ", "None" } or nil

      return vt
    end,
    only_current_line = false,
    -- highlight group
    highlight = "LspInlayHint",
    -- virt_text priority
    priority = 0,
  },
  enabled_at_startup = true,
  debug_mode = false,
}

return {
  "lvimuser/lsp-inlayhints.nvim",
  -- Inlay hints now provided by nvim-lsp
  enabled = false,
  branch = "anticonceal",
  event = "VeryLazy",
  opts = opts,
  config = function()
    vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
    vim.api.nvim_create_autocmd("LspAttach", {
      group = "LspAttach_inlayhints",
      callback = function(args)
        if not (args.data and args.data.client_id) then
          return
        end

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp-inlayhints").on_attach(client, bufnr)
      end,
    })
  end,
}
