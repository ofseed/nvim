local custom = require "custom"

---@type LazyPluginSpec
return {
  "ibhagwan/fzf-lua",
  cmd = { "FzfLua" },
  opts = {
    fzf_colors = {
      ["fg"] = { "fg", "CursorLine" },
      ["bg"] = { "bg", "Normal" },
      ["hl"] = { "fg", "Statement" },
      ["fg+"] = { "fg", "Normal" },
      ["bg+"] = { "bg", "CursorLine" },
      ["hl+"] = { "fg", "Statement" },
      ["info"] = { "fg", "PreProc" },
      ["prompt"] = { "fg", "Conditional" },
      ["pointer"] = { "fg", "Exception" },
      ["marker"] = { "fg", "Keyword" },
      ["spinner"] = { "fg", "Label" },
      ["header"] = { "fg", "Comment" },
      ["gutter"] = { "bg", "Normal" },
    },
    winopts = {
      border = custom.border,
    },
    lsp = {
      symbols = {
        symbol_icons = custom.icons.kind,
      },
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
      "<leader>fw",
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

    -- git
    {
      "<leader>fgc",
      function()
        require("fzf-lua").git_commits()
      end,
      desc = "Commits",
    },
    {
      "<leader>fgb",
      function()
        require("fzf-lua").git_branchs()
      end,
      desc = "Branchs",
    },
    {
      "<leader>fgb",
      function()
        require("fzf-lua").git_tags()
      end,
      desc = "Tags",
    },

    -- dap
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
