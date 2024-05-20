---@type LazyPluginSpec
return {
  "pwntester/octo.nvim",
  cmd = { "Octo" },
  opts = {
    picker = "fzf-lua",
    picker_config = {
      use_emojis = true,
    },
  },
}
