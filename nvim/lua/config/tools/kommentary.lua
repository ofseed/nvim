local ok, config = pcall(require, "kommentary.config")
if not ok then
  return
end

config.configure_language("default", {
  prefer_single_line_comments = true,
})

config.configure_language("html", {
  single_line_comment_string = "auto",
  multi_line_comment_strings = "auto",
  hook_function = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})
