---@type LazyPluginSpec
return {
  "3rd/image.nvim",
  enabled = vim.uv.os_uname().sysname ~= "Windows_NT",
  ft = { "markdown", "org", "norg" },
  event = function(plugin)
    return {
      {
        event = "BufRead",
        pattern = plugin.opts.hijack_file_patterns,
      },
    }
  end,
  init = function()
    package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.nix-profile/share/lua/5.1/?/init.lua;"
    package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.nix-profile/share/lua/5.1/?.lua;"
  end,
  opts = {
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
  },
}
