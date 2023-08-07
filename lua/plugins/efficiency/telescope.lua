return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "benfowler/telescope-luasnip.nvim" },
  },
  config = function()
    local telescope = require "telescope"

    local function flash(prompt_bufnr)
      require("flash").jump {
        pattern = "^",
        label = { after = { 0, 0 } },
        search = {
          mode = "search",
          exclude = {
            function(win)
              return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
            end,
          },
        },
        action = function(match)
          local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      }
    end

    telescope.setup {
      defaults = {
        mappings = {
          n = { s = flash },
          i = { ["<c-s>"] = flash },
        },
      },
      pickers = {
        find_files = {
          theme = "ivy",
        },
        oldfiles = {
          theme = "ivy",
        },
      },
      extensions = {
        live_grep_args = {
          theme = "dropdown",
        },
      },
    }

    local extensions = {
      "dap",
      "fzy_native",
      "notify",
      "live_grep_args",
      "luasnip",
    }

    for _, ext in ipairs(extensions) do
      local ok = pcall(telescope.load_extension, ext)
      if not ok then
        vim.print("Failed to load telescope extension: " .. ext)
      end
    end
  end,
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files",
    },
    {
      "<leader>f?",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Help tags",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "Old files",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      desc = "Symbols",
    },
    {
      "<leader>fS",
      function()
        require("telescope.builtin").lsp_workspace_symbols()
      end,
      desc = "Symbols",
    },
    {
      "<leader>fc",
      function()
        require("telescope.builtin").colorscheme()
      end,
      desc = "Colorscheme",
    },
    {
      "<leader>fg",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      desc = "Live grep",
    },
    {
      "<leader>fn",
      function()
        require("telescope").extensions.notify.notify()
      end,
      desc = "Notify",
    },
    {
      "<leader>fde",
      function()
        require("telescope").extensions.dap.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>fdc",
      function()
        require("telescope").extensions.dap.configurations()
      end,
      desc = "Configurations",
    },
    {
      "<leader>fdb",
      function()
        require("telescope").extensions.dap.list_breakpoints()
      end,
      desc = "Breakpoints",
    },
    {
      "<leader>fdv",
      function()
        require("telescope").extensions.dap.variables()
      end,
      desc = "Variables",
    },
    {
      "<leader>fdf",
      function()
        require("telescope").extensions.dap.frames()
      end,
      desc = "Frames",
    },
  },
}
