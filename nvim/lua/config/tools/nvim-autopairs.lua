local autopairs = require("nvim-autopairs")
local rule = require('nvim-autopairs.rule')

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = {'string'},-- it will not add pair on that treesitter node
    javascript = {'template_string'},
    java = false,-- don't check treesitter on java
  }
})

require('nvim-treesitter.configs').setup {
  autopairs = {enable = true}
}

local ts_conds = require('nvim-autopairs.ts-conds')


-- press % => %% is only inside comment or string
autopairs.add_rules({
  rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})

require'nvim-autopairs.completion.cmp'.setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true -- automatically select the first item
})
