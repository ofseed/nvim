local autopairs = require "nvim-autopairs"
local rule = require "nvim-autopairs.rule"

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
  rule("{ ", " ", "html"),
  rule("{ ", " ", "htmldjango"),
  rule("{%", "%", "htmldjango"),
  rule("{% ", " ", "htmldjango"),
  rule("{ ", " ", "lua"),
  rule("{ ", " ", "lua"),
}
