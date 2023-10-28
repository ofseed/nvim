return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  config = function()
    local illuminate = require "illuminate"
    illuminate.configure {}

    -- Highlight on yank
    -- conflict with vim-illuminate
    vim.api.nvim_create_autocmd("TextYankPost", {
      group = vim.api.nvim_create_augroup("highlight_on_yank", {}),
      desc = "Briefly highlight yanked text",
      callback = function()
        illuminate.pause()
        vim.highlight.on_yank()
        illuminate.resume()
      end,
    })
  end,
  keys = {
    {
      "<M-n>",
      function()
        require("illuminate").goto_next_reference()
      end,
      { desc = "Next reference" },
    },
    {
      "<M-p>",
      function()
        require("illuminate").goto_prev_reference()
      end,
      { desc = "Prev reference" },
    },
  },
}
