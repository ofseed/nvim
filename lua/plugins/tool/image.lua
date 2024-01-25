return {
  "3rd/image.nvim",
  init = function()
    package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.nix-profile/share/lua/5.1/?/init.lua;"
    package.path = package.path .. ";" .. vim.fn.expand "$HOME" .. "/.nix-profile/share/lua/5.1/?.lua;"
  end,
  event = "VeryLazy",
  opts = {},
}
