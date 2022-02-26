local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  return
end

local Rule = require "nvim-autopairs.rule"

autopairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string" }, -- it will not add pair on that treesitter node
    javascript = { "template_string" },
    java = false, -- don't check treesitter on java
  },
}

require("nvim-treesitter.configs").setup {
  autopairs = { enable = true },
}

autopairs.add_rules {
  Rule("{ ", " ", "-vim"),
  Rule("{%", "%", "htmldjango"),
  Rule("{% ", " ", "htmldjango"),
}
