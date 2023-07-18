local opts = {
  check_ts = true,
  ts_config = {
    lua = { "string" }, -- it will not add pair on that treesitter node
    javascript = { "template_string" },
    java = false, -- don't check treesitter on java
  },
}

return {
  "windwp/nvim-autopairs",
  event = "VeryLazy",
  opts = opts,
}
