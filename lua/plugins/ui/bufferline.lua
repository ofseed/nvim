---@type LazyPluginSpec
return {
  "ofseed/bufferline.nvim",
  -- https://github.com/akinsho/bufferline.nvim/pull/944
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.o.showtabline = 2
    vim.o.tabline = " "
  end,
  opts = {
    options = {
      hover = {
        enabled = true,
        delay = 0,
        reveal = { "close" },
      },
      mode = "tabs",
      name_formatter = function(args)
        if vim.bo[args.bufnr].buftype ~= "" then
          for _, bufnr in ipairs(args.buffers) do
            if vim.bo[bufnr].buftype == "" then
              return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
            end
          end
        end
      end,
      get_element_icon = function(args)
        local loaded, devicons = pcall(require, "nvim-web-devicons")
        if not loaded then
          return ""
        end
        if vim.bo[args.bufnr].buftype ~= "" then
          for _, bufnr in ipairs(args.buffers) do
            if vim.bo[bufnr].buftype == "" then
              return devicons.get_icon(
                vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t"),
                nil,
                { default = true }
              )
            end
          end
        end
      end,
      show_close_icon = false,
      buffer_close_icon = "🗙",
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          text_align = "center",
          saperator = true,
        },
        {
          filetype = "aerial",
          text = "Outline",
          text_align = "center",
          saperator = true,
        },
        {
          filetype = "Outline",
          text = "Outline",
          text_align = "center",
          saperator = true,
        },
        {
          filetype = "dbui",
          text = "Database Manager",
          text_align = "center",
          saperator = true,
        },
        {
          filetype = "DiffviewFiles",
          text = "Source Control",
          text_align = "center",
          separator = true,
        },
        {
          filetype = "httpResult",
          text = "Http Result",
          text_align = "center",
          saperator = true,
        },
        {
          filetype = "OverseerList",
          text = "Tasks",
          text_align = "center",
          saperator = true,
        },
        {
          filetype = "flutterToolsOutline",
          text = "Flutter Outline",
          text_align = "center",
          saperator = true,
        },
      },
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count)
        return "(" .. count .. ")"
      end,
      show_duplicate_prefix = false,
      always_show_bufferline = true,
      sort_by = "tabs",
    },
  },
  keys = {
    {
      "<leader>1",
      "<Cmd>BufferLineGoToBuffer 1<CR>",
      desc = "Go to tab 1",
    },
    {
      "<leader>2",
      "<Cmd>BufferLineGoToBuffer 2<CR>",
      desc = "Go to tab 2",
    },
    {
      "<leader>3",
      "<Cmd>BufferLineGoToBuffer 3<CR>",
      desc = "Go to tab 3",
    },
    {
      "<leader>4",
      "<Cmd>BufferLineGoToBuffer 4<CR>",
      desc = "Go to tab 4",
    },
    {
      "<leader>5",
      "<Cmd>BufferLineGoToBuffer 5<CR>",
      desc = "Go to tab 5",
    },
    {
      "<leader>6",
      "<Cmd>BufferLineGoToBuffer 6<CR>",
      desc = "Go to tab 6",
    },
    {
      "<leader>7",
      "<Cmd>BufferLineGoToBuffer 7<CR>",
      desc = "Go to tab 7",
    },
    {
      "<leader>8",
      "<Cmd>BufferLineGoToBuffer 8<CR>",
      desc = "Go to tab 8",
    },
    {
      "<leader>9",
      "<Cmd>BufferLineGoToBuffer 9<CR>",
      desc = "Go to tab 9",
    },

    { "<M-S-Right>", "<Cmd>+tabmove<CR>", desc = "Move tab to next" },
    { "<M-S-Left>", "<Cmd>-tabmove<CR>", desc = "Move tab to previous" },

    { "<leader>bc", "<cmd>BufferLinePickClose<CR>", desc = "Close" },
    {
      "<leader>bse",
      "<cmd>BufferLineSortByExtension<CR>",
      desc = "By extension",
    },
    {
      "<leader>bsd",
      "<cmd>BufferLineSortByDirectory<CR>",
      desc = "By directory",
    },
    { "<leader>bst", "<cmd>BufferLineSortByTabs<CR>", desc = "By tabs" },
  },
}
