local ok, snip = pcall(require, "luasnip")
if not ok then
  vim.notify "Could not load luasnip"
  return
end

local types = require "luasnip.util.types"

snip.config.setup {
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "●", "DiagnosticWarn" } },
      },
    },
    [types.insertNode] = {
      active = {
        virt_text = { { "●", "DiagnosticInfo" } },
      },
    },
  },
}
