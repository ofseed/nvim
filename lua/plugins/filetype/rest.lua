---@type LazyPluginSpec
return {
  "rest-nvim/rest.nvim",
  ft = { "http" },
  opts = {},
  config = function(_, opts)
    require("rest-nvim").setup(opts)

    vim.keymap.set("n", "<localleader>r", "<Cmd>Rest run<CR>", { silent = true, desc = "Run request under the cursor" })
    vim.keymap.set("n", "<localleader>l", "<Cmd>Rest run last<CR>", { silent = true, desc = "Re-run latest request" })
  end,
}
