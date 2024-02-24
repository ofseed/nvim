local custom = require "custom"

---@type LazyPluginSpec
return {
  "ibhagwan/fzf-lua",
  enabled = false,
  cmd = { "FzfLua" },
  opts = {
    winopts = {
      border = custom.border,
    },
    lsp = {
      symbols = custom.icons.kind,
    },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "Files",
    },
    {
      "<leader>fb",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>f?",
      function()
        require("fzf-lua").help_tags()
      end,
      desc = "Help tags",
    },
    {
      "<leader>fh",
      function()
        require("fzf-lua").oldfiles()
      end,
      desc = "Old files",
    },
    {
      "<leader>fm",
      function()
        require("fzf-lua").marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>fs",
      function()
        require("fzf-lua").lsp_document_symbols()
      end,
      desc = "Symbols",
    },
    {
      "<leader>fS",
      function()
        require("fzf-lua").lsp_workspace_symbols()
      end,
      desc = "Symbols",
    },
    {
      "<leader>fc",
      function()
        require("fzf-lua").colorschemes()
      end,
      desc = "Colorscheme",
    },
    {
      "<leader>fj",
      function()
        require("fzf-lua").jump()
      end,
      desc = "Jumplist",
    },
    {
      "<leader>fg",
      function()
        require("fzf-lua").live_grep_native()
      end,
      desc = "Live grep",
    },
    {
      "<leader>fn",
      function()
        -- To be implement
      end,
      desc = "Notify",
    },
    {
      "<leader>fde",
      function()
        require("fzf-lua").dap_commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>fdc",
      function()
        require("fzf-lua").dap_configurations()
      end,
      desc = "Configurations",
    },
    {
      "<leader>fdb",
      function()
        require("fzf-lua").dap_breakpoints()
      end,
      desc = "Breakpoints",
    },
    {
      "<leader>fdv",
      function()
        require("fzf-lua").dap_variables()
      end,
      desc = "Variables",
    },
    {
      "<leader>fdf",
      function()
        require("fzf-lua").dap_frames()
      end,
      desc = "Frames",
    },
  },
}
