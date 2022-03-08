local ok, kommentary = pcall(require, "kommentary.config")
if not ok then
  vim.notify "Could not load Kommentary"
  return
end

kommentary.configure_language("default", {
  prefer_single_line_comments = true,
})

kommentary.configure_language("html", {
  single_line_comment_string = "auto",
  multi_line_comment_strings = "auto",
  hook_function = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})

kommentary.configure_language("vue", {
  single_line_comment_string = "auto",
  multi_line_comment_strings = "auto",
  hook_function = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})
