return {
  "kevinhwang91/nvim-fundo",
  requires = "kevinhwang91/promise-async",
  run = function()
    require("fundo").install()
  end,
  opts = true,
  enabled = false,
}
