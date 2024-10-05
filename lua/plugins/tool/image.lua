---@type LazyPluginSpec
return {
  "3rd/image.nvim",
  enabled = vim.uv.os_uname().sysname ~= "Windows_NT",
  init = function()
    if vim.uv.os_uname().sysname == "Linux" then
      vim.uv.fs_stat("/etc/NIXOS", function(_, stat)
        if stat then
          ---@diagnostic disable-next-line: missing-parameter
          local home = vim.uv.os_getenv "HOME"
          package.path = table.concat({
            home .. "/.nix-profile/share/lua/5.1/?/init.lua",
            home .. "/.nix-profile/share/lua/5.1/?.lua",
            package.path,
          }, ";")
        end
      end)
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
