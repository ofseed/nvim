local custom = require "custom"
local kinds = vim.iter(custom.icons.kind):fold({}, function(t, k, v)
  t[k] = { icon = v }
  return t
end)

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
  },
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function(args)
        local stats = vim.uv.fs_stat(args.file)

        if not stats or stats.type ~= "directory" then
          return
        end

        require "neo-tree"

        return true
      end,
    })
  end,
  opts = {
    default_source = "last",
    popup_border_style = custom.border,
    default_component_configs = {
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
      },
    },
    source_selector = {
      winbar = true,
      sources = {
        {
          source = "filesystem",
          display_name = "  Files ",
        },
        {
          source = "buffers",
          display_name = "  Buffers ",
        },
        {
          source = "git_status",
          display_name = "  Git ",
        },
        {
          source = "document_symbols",
          display_name = "  Symbols",
        },
      },
    },
    window = {
      width = custom.width,
      mappings = {
        ["<Space>"] = "none",
        ["o"] = "system_open",

        ["h"] = "smart_h",
        ["l"] = "smart_l",

        -- Swap default split behavior
        ["S"] = "open_vsplit",
        ["s"] = "open_split",
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        vim.ui.open(path)
      end,

      smart_h = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" and node:is_expanded() then
          require("neo-tree.sources.filesystem").toggle_directory(state, node)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,

      smart_l = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" then
          if not node:is_expanded() then
            require("neo-tree.sources.filesystem").toggle_directory(state, node)
          elseif node:has_children() then
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        elseif node.type == "file" then
          require("neo-tree.sources.filesystem.commands").open(state)
        end
      end,
    },
    filesystem = {
      group_empty_dirs = true,
      follow_current_file = {
        enabled = true,
      },
      window = {
        mappings = {
          ["[g"] = "none",
          ["]g"] = "none",
          ["[h"] = "prev_git_modified",
          ["]h"] = "next_git_modified",
        },
      },
    },
    document_symbols = {
      kinds = kinds,
    },
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File Explorer" },
  },
}
