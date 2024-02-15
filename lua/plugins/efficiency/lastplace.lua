---@type LazyPluginSpec
return {
  "ethanholz/nvim-lastplace",
  event = {
    "BufReadPre",
  },
  opts = {
    lastplace_ignore_buftype = {
      "nofile",
    },
  },
}
