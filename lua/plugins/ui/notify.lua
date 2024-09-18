---@type LazyPluginSpec
return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = function()
    local stages_util = require "notify.stages.util"
    local direction = stages_util.DIRECTION.BOTTOM_UP

    return {
      render = "minimal",

      -- Modified from "static"
      stages = {
        function(state)
          local next_height = state.message.height + 2
          local next_row = stages_util.available_slot(
            state.open_windows,
            next_height,
            direction
          )
          if not next_row then
            return nil
          end
          return {
            relative = "editor",
            anchor = "NE",
            width = state.message.width,
            height = state.message.height,
            col = vim.opt.columns:get(),
            row = next_row,
            border = "rounded",
            style = "minimal",
          }
        end,
        function()
          return {
            col = vim.opt.columns:get(),
            time = true,
          }
        end,
      },
    }
  end,
}
