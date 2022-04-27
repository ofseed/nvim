local ok, specs = pcall(require, "specs")
if not ok then
  vim.notify "Could not load specs"
  return
end

specs.setup {
  show_jumps = true,
  min_jump = 30,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 12, -- time increments used for fade/resize effects
    blend = 30, -- starting blend, between 0-100 (fully transparent), see :h winblend
    width = 25,
    winhl = "Visual",
    fader = require("specs").exp_fader,
    resizer = require("specs").shrink_resizer,
  },
  ignore_filetypes = {},
  ignore_buftypes = {
    nofile = true,
  },
}

-- Press <C-b> to call specs!
-- vim.keymap.set("n", "<C-b>", ':lua require("specs").show_specs()<CR>')

-- You can even bind it to search jumping and more, example:
vim.keymap.set("n", "n", 'n:lua require("specs").show_specs()<CR>')
vim.keymap.set("n", "N", 'N:lua require("specs").show_specs()<CR>')
