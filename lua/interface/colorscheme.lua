vim.g.tokyonight_transparent = 0
vim.g.tokyonight_day_brightness = 0.3
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_lualine_bold = 1
vim.g.tokyonight_sidebars = { "Outline", "packer", "aerial" }
vim.g.vscode_style = "dark"
vim.g.gruvbox_transparent_bg = 0
vim.g.gruvbox_underline = 0
vim.g.gruvbox_invert_selection = 0
vim.g.github_sidebars = { "Outline", "packer" }
local ok, nightfox = pcall(require, "nightfox")
if ok then
  nightfox.setup {
    styles = {
      comments = "italic",
    },
  }
end

vim.cmd "colorscheme nightfox"
