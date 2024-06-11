---@type LazyPluginSpec
return {
  "rest-nvim/rest.nvim",
  dependencies = {
    "vhyrro/luarocks.nvim",
  },
  ft = { "http" },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "http",
      callback = function(args)
        local bufnr = args.buf
        require "rest-nvim"

        vim.keymap.set("n", "<localleader>r", "<Cmd>Rest run<CR>", {
          buffer = bufnr,
          silent = true,
          desc = "Run request under the cursor",
        })
        vim.keymap.set(
          "n",
          "<localleader>l",
          "<Cmd>Rest run last<CR>",
          { buffer = bufnr, silent = true, desc = "Re-run latest request" }
        )
      end,
    })
  end,
  main = "rest-nvim",
  opts = {},
}
