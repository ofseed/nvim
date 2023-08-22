local custom = require "custom"

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "s1n7ax/nvim-window-picker",
  },
  opts = {
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
      },
    },
    window = {
      width = custom.width,
      mappings = {
        ["<Space>"] = "none",
        ["o"] = "system_open",
        ["h"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" and node:is_expanded() then
            require("neo-tree.sources.filesystem").toggle_directory(state, node)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        ["l"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" then
            if not node:is_expanded() then
              require("neo-tree.sources.filesystem").toggle_directory(state, node)
            elseif node:has_children() then
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          end
        end,
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        path = vim.fn.shellescape(path)
        if vim.uv.os_uname().sysname == "Linux" then
          vim.cmd(vim.fs.joinpath("silent !xdg-open ", path))
        end
      end,
    },
    filesystem = {
      group_empty_dirs = true,
      follow_current_file = {
        enabled = true,
      },
      mappings = {
        ["[g"] = "none",
        ["]g"] = "none",
        ["[c]"] = "prev_git_modified",
        ["]c"] = "next_git_modified",
      },
    },
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File Explorer" },
  },
}
