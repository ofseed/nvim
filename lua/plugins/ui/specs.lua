local opts = {}

return {
  "edluffy/specs.nvim",
  -- Disable because it's conflicting with the chinese text
  enabled = false,
  opts = opts,
  keys = {
    -- Press <C-b> to call specs!
    -- vim.keymap.set("n", "<C-b>", ':lua require("specs").show_specs()<CR>')

    -- You can even bind it to search jumping and more, example:
    { "n", 'n:lua require("specs").show_specs()<CR>' },
    { "N", 'N:lua require("specs").show_specs()<CR>' },
  },
}
