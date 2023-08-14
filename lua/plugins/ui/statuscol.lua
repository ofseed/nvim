local config = function()

local statuscol = require "statuscol"

local builtin = require "statuscol.builtin"

statuscol.setup {
  bt_ignore = { "nofile", "terminal" },
  segments = {
    {
      sign = { name = { ".*" } },
      click = "v:lua.ScSa",
    },
    {
      text = { builtin.lnumfunc },
      click = "v:lua.ScLa",
    },
    {
      sign = { name = { "GitSigns" }, colwidth = 1, wrap = true },
      click = "v:lua.ScSa",
    },
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  },
}

end

return {
  "luukvbaal/statuscol.nvim",
  config = config,
}
