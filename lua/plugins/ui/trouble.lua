---@type LazyPluginSpec
return {
  "folke/trouble.nvim",
  enabled = false,
  branch = "dev",
  init = function()
    -- HACK: Hijack quickfix to open trouble
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "qf",
      callback = function(args)
        local bufnr = args.buf
        vim.defer_fn(function()
          local winid = vim.fn.bufwinid(bufnr)
          if winid == -1 then
            return
          end
          vim.api.nvim_win_close(winid, true)
          require("trouble").open "quickfix"
        end, 0)
      end,
    })
  end,
  keys = {
    {
      "<leader>q",
      function()
        require("trouble").toggle "quickfix"
      end,
      desc = "Quickfix",
    },
  },
  opts = {},
}
