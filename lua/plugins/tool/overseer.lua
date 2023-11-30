return {
  "stevearc/overseer.nvim",
  config = function()
    local overseer = require "overseer"
    local custom = require "custom"

    overseer.setup {
      strategy = {
        "toggleterm",
        quit_on_exit = "success",
      },
      form = {
        border = custom.border,
      },
      confirm = {
        border = custom.border,
      },
      task_win = {
        border = custom.border,
      },
      component_aliases = {
        default = {
          { "display_duration", detail_level = 2 },
          "on_output_summarize",
          "on_exit_set_status",
          "on_complete_notify",
          "on_complete_dispose",
          "unique",
        },
      },
    }

    local lualine = require "lualine"
    local lualine_cfg = lualine.get_config()
    for i, item in ipairs(lualine_cfg.sections.lualine_x) do
      if type(item) == "table" and item.name == "overseer-placeholder" then
        lualine_cfg.sections.lualine_x[i] = "overseer"
      end
    end
    lualine.setup(lualine_cfg)
  end,
  keys = {
    { "<leader>rr", "<cmd>OverseerRun<CR>", desc = "Run" },
    { "<leader>rl", "<cmd>OverseerToggle<CR>", desc = "List" },
    { "<leader>rn", "<cmd>OverseerBuild<CR>", desc = "New" },
    { "<leader>ra", "<cmd>OverseerTaskAction<CR>", desc = "Action" },
    { "<leader>ri", "<cmd>OverseerInfo<CR>", desc = "Info" },
    { "<leader>rc", "<cmd>OverseerClearCache<CR>", desc = "Clear cache" },
  },
}
