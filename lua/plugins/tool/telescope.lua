---@type LazyPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
  },
  opts = function()
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

    return {
      defaults = {
        mappings = {
          n = {
            s = flash,
            f = require("telescope.actions").to_fuzzy_refine,
          },
          i = {
            ["<c-s>"] = flash,
            ["<c-f>"] = require("telescope.actions").to_fuzzy_refine,
          },
        },
        prompt_prefix = " ",
        selection_caret = " ",
      },
      pickers = {
        find_files = {
          theme = "ivy",
        },
        oldfiles = {
          theme = "ivy",
        },
        jumplist = {
          theme = "dropdown",
        },
      },
      extensions = {
        live_grep_args = {
          theme = "dropdown",
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require "telescope"

    telescope.setup(opts)

    local extensions = {
      "fzy_native",
      "notify",
    }

    for _, ext in ipairs(extensions) do
      local ok = pcall(telescope.load_extension, ext)
      if not ok then
        vim.print("Failed to load telescope extension: " .. ext)
      end
    end
  end,
  cmd = {
    "Telescope",
  },
  keys = {
    {
      "<leader>fn",
      function()
        require("telescope").extensions.notify.notify()
      end,
      desc = "Notify",
    },
  },
}
