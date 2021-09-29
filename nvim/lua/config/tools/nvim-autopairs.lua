local autopairs = require "nvim-autopairs"
local rule = require "nvim-autopairs.rule"
local ts_conds = require "nvim-autopairs.ts-conds"

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
}

require("nvim-autopairs.completion.cmp").setup {
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true, -- automatically select the first item
}
