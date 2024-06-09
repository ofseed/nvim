---@type LazyPluginSpec
return {
  "3rd/image.nvim",
  enabled = vim.uv.os_uname().sysname ~= "Windows_NT",
  ft = { "markdown", "org", "norg" },
  dependencies = {
    "vhyrro/luarocks.nvim",
  },
  event = function(plugin)
    return {
      {
        event = "BufRead",
        pattern = plugin.opts.hijack_file_patterns,
      },
    }
  end,
  opts = {
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
  },
}
