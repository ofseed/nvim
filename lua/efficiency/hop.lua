local opts = {
  keys = "etovxqpdygfblzhckisuran",
  jump_on_sole_occurrence = false,
}

return {
  "phaazon/hop.nvim",
  -- Replace with flash
  branch = "v2",
  event = "VeryLazy",
  enabled = false,
  opts = opts,
  keys = {

    { "sf", "<Cmd>HopChar1AC<CR>", mode = { "n", "v" }, desc = "Char after" }, -- Case ignored
    { "<Leader>hf", "<Cmd>HopChar1AC<CR>", mode = { "n", "v", "o" }, desc = "Char after" },

    { "sF", "<Cmd>HopChar1BC<CR>", mode = { "n", "v" }, desc = "Char after" }, -- Case ignored
    { "<Leader>hF", "<Cmd>HopChar1BC<CR>", mode = { "n", "v", "o" }, desc = "Char after" },
    -- t, T not implemented yet
    { "sw", "<Cmd>HopWordAC<CR>", mode = { "n", "v" }, desc = "Word" },
    { "<Leader>hw", "<Cmd>HopWordAC<CR>", mode = { "n", "v", "o" }, desc = "Word" },
    -- W not implemented yet
    { "sb", "<Cmd>HopWordBC<CR>", mode = { "n", "v" }, desc = "Word reverse" },
    { "<Leader>hb", "<Cmd>HopWordBC<CR>", mode = { "n", "v", "o" }, desc = "Word reverse" },
    -- B, e, E, ge, gE not implemented yet
    { "sj", "<Cmd>HopLineStartAC<CR>", mode = { "n", "v" }, desc = "Line after" },
    { "<Leader>hj", "<Cmd>HopLineStartAC<CR>", mode = { "n", "v", "o" }, desc = "Line after" },

    { "sk", "<Cmd>HopLineStartBC<CR>", mode = { "n", "v" }, desc = "Line before" },
    { "<Leader>hk", "<Cmd>HopLineStartBC<CR>", mode = { "n", "v", "o" }, desc = "Line before" },
    -- n, N not implemented yet
    { "ss", "<Cmd>HopChar1MW<CR>", mode = { "n", "v" }, desc = "Char" },
    { "<Leader>hs", "<Cmd>HopChar1MW<CR>", mode = { "n", "v", "o" }, desc = "Char" },
  },
}
