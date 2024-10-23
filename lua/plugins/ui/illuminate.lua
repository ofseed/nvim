---@type LazyPluginSpec
return {
  "ofseed/vim-illuminate",
  cond = vim.lsp.document_highlight == nil,
  event = "VeryLazy",
  opts = function()
    return {
      filetypes_denylist = {
        "xxd",
        "floggraph",
      },
      large_file_cutoff = 10000,
      should_enable = function(bufnr)
        local win = vim.fn.bufwinid(bufnr)
        -- Very bad performance in diff-mode
        if vim.wo[win].diff then
          return false
        end
        return true
      end,
    }
  end,
  config = function(_, opts)
    local illuminate = require "illuminate"
    illuminate.configure(opts)

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
      "]r",
      function()
        require("illuminate").goto_next_reference()
      end,
      desc = "Next reference",
    },
    {
      "[r",
      function()
        require("illuminate").goto_prev_reference()
      end,
      desc = "Prev reference",
    },
    {
      "<leader>ti",
      function()
        require("illuminate").toggle_freeze_buf()
      end,
      desc = "Toggle Freeze reference",
    },
  },
}
