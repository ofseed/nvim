local ok, ffhighlight = pcall(require, "fFHighlight")
if not ok then
  vim.notify "Could not load ffhighlight"
  return
end

ffhighlight.setup {
  -- Disable keymaps, users should map them manually
  disable_keymap = false,
  -- Disable the feature of highlighting words
  disable_words_hl = false,
  -- If the count of repeating latest `f` or `F` to the char is equal or greater
  -- than this value, use number to overlap char. minimal value is 2
  number_hint_threshold = 3,
  -- The optional dict argument for sign_define(), `:h sign_define()` for
  -- more details. If this value is `{}`, will disable sign for prompt
  prompt_sign_define = { text = "->", text_hl = "fFPromptSign", culhl = "fFPromptSign" },
}

vim.cmd [[
  hi fFHintChar ctermfg=yellow cterm=bold,undercurl guifg=yellow gui=bold,undercurl
  hi fFHintWords cterm=undercurl gui=undercurl guisp=yellow
  hi fFPromptSign ctermfg=yellow cterm=bold guifg=yellow gui=bold
]]
