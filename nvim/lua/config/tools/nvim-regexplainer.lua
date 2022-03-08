local ok, regexplainer = pcall(require, "regexplainer")
if not ok then
  vim.notify "Could not load regexplainer"
  return
end

regexplainer.setup {
  -- 'narrative'
  mode = "narrative", -- TODO: 'ascii', 'graphical'

  -- automatically show the explainer when the cursor enters a regexp
  auto = false,

  -- Whether to log debug messages
  debug = false,

  -- 'split', 'popup'
  display = "popup",

  mappings = {
    show = "gR",
  },

  narrative = {
    separator = "\n",
  },
}
