local ok, comments = pcall(require, "todo-comments")
if not ok then
  vim.notify "Could not load todo-comments"
  return
end

comments.setup {}
