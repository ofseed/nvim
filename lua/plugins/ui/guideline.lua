---@type LazyPluginSpec
return {
  "ofseed/guideline.nvim",
  init = function ()
    vim.o.showtabline = 2
  end,
  ---@module "guideline"
  ---@type GuideLine.Options
  opts = {},
}
