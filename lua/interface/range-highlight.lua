local ok, highlight = pcall(require, "range-highlight")
if not ok then
  vim.notify "Could not load range-highlight"
  return
end

highlight.setup {
  highlight = "Visual",
  highlight_with_out_range = {
    d = true,
    delete = true,
    m = true,
    move = true,
    y = true,
    yank = true,
    c = true,
    change = true,
    j = true,
    join = true,
    ["<"] = true,
    [">"] = true,
    s = true,
    subsititue = true,
    sno = true,
    snomagic = true,
    sm = true,
    smagic = true,
    ret = true,
    retab = true,
    t = true,
    co = true,
    copy = true,
    ce = true,
    center = true,
    ri = true,
    right = true,
    le = true,
    left = true,
    sor = true,
    sort = true,
  },
}
