local custom = require "custom"
local utils = require "utils"

local mode = custom.prefer_tabpage and "tab" or "buffer"

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.o.showtabline = 2
    vim.o.tabline = " "
  end,
  config = function()
    require("bufferline").setup {
      options = {
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },
        mode = custom.prefer_tabpage and "tabs" or "buffers",
        -- numbers = custom.prefer_tabpage and "ordinal" or "none",
        show_close_icon = false,
        offsets = {
          { filetype = "neo-tree", text = "Explorer", text_align = "center", saperator = true },
          { filetype = "aerial", text = "Outline", text_align = "center", saperator = true },
          { filetype = "Outline", text = "Outline", text_align = "center", saperator = true },
          { filetype = "dbui", text = "Database Manager", text_align = "center", saperator = true },
          { filetype = "httpResult", text = "Http Result", text_align = "center", saperator = true },
          { filetype = "OverseerList", text = "Tasks", text_align = "center", saperator = true },
          { filetype = "flutterToolsOutline", text = "Flutter Outline", text_align = "center", saperator = true },
        },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count)
          return "(" .. count .. ")"
        end,
        show_duplicate_prefix = false,
        sort_by = custom.prefer_tabpage and "tabs" or "insert_after_current",
      },
    }
  end,
  keys = {
    { "<M-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to " .. mode .. " 1" },
    { "<M-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to " .. mode .. " 2" },
    { "<M-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to " .. mode .. " 3" },
    { "<M-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to " .. mode .. " 4" },
    { "<M-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "Go to " .. mode .. " 5" },
    { "<M-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "Go to " .. mode .. " 6" },
    { "<M-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "Go to " .. mode .. " 7" },
    { "<M-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "Go to " .. mode .. " 8" },
    { "<M-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "Go to " .. mode .. " 9" },

    custom.prefer_tabpage and { "<M-S-Right>", "<Cmd>+tabmove<CR>", desc = "Move tab to next" }
      or { "<M-S-Right>", "<Cmd>BufferLineMoveNext<CR>", desc = "Move buffer to next" },
    custom.prefer_tabpage and { "<M-S-Left>", "<Cmd>-tabmove<CR>", desc = "Move tab to previous" }
      or { "<M-S-Right>", "<Cmd>BufferLineMovePrev<CR>", desc = "Move buffer to previous" },

    { "]b", "<cmd>BufferLineCycleNext<CR>", desc = utils.firstToUpper(mode) },
    { "[b", "<cmd>BufferLineCyclePrev<CR>", desc = utils.firstToUpper(mode) },

    { "<leader>bc", "<cmd>BufferLinePickClose<CR>", desc = "Close" },
    { "<leader>bse", "<cmd>BufferLineSortByExtension<CR>", desc = "By extension" },
    { "<leader>bsd", "<cmd>BufferLineSortByDirectory<CR>", desc = "By directory" },
    { "<leader>bst", "<cmd>BufferLineSortByTabs<CR>", desc = "By tabs" },
  },
}
