---@type LazyPluginSpec
return {
  "3rd/image.nvim",
  enabled = vim.uv.os_uname().sysname ~= "Windows_NT",
  init = function()
    local hostname = vim.uv.os_gethostname()
    if hostname == "nixos" then
      package.path = table.concat({
        package.path,
        vim.env.HOME .. "/.nix-profile/share/lua/5.1/?/init.lua",
        vim.env.HOME .. "/.nix-profile/share/lua/5.1/?.lua",
      }, ";")
    end
  end,
  dependencies = {
    { "leafo/magick" },
  },
  ft = { "markdown", "org", "norg" },
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
