return {
  "willothy/wezterm.nvim",
  cond = vim.env.TERM == "wezterm",
  cmds = {
    "WeztermSpawn",
  },
  opts = {},
}
