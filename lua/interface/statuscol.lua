local ok, statuscol = pcall(require, "statuscol")
if not ok then
  vim.notify "Could not load statuscol"
end

local builtin = require "statuscol.builtin"

statuscol.setup {
  segments = {
    {
      sign = { name = { ".*" } },
      click = "v:lua.ScSa",
    },
    {
      text = { builtin.lnumfunc },
      condition = { true, builtin.not_empty },
      click = "v:lua.ScLa",
    },
    {
      sign = { name = { "GitSigns" }, colwidth = 1, wrap = true },
      click = "v:lua.ScSa",
    },
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  },
}
