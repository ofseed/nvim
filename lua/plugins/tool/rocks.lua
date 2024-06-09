---@type LazyPluginSpec
return {
  "vhyrro/luarocks.nvim",
  lazy = true,
  priority = 999,
  opts = {
    rocks = {
      -- Needed by image.nvim
      "magick",

      -- Needed by rest.nvim
      "lua-curl",
      "mimetypes",
      "xml2lua",
    },
  },
}
