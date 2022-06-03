vim.g.Illuminate_ftblacklist = {
  "NvimTree",
  "Outline",
  "aerial",
  "packer",
  "alpha",
  "NeogitStatus",
  "NeogitPopup",
  "org",
  "orghelp",
}

vim.keymap.set("n", "<M-n>", function()
  require("illuminate").next_reference { wrap = true }
end, { desc = "Next reference" })
vim.keymap.set("n", "<M-p>", function()
  require("illuminate").next_reference { reverse = true, wrap = true }
end, { desc = "Prev reference" })
