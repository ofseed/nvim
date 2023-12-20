return {
  "ray-x/go.nvim",
  event = {
    "BufRead *.go,*.mod,*.sum",
    "BufNewFile *.go,*.mod,*.sum",
  },
  dependencies = {
    "ray-x/guihua.lua",
    "mason-lspconfig.nvim",
  },
  opts = {},
}
