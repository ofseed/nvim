local ok, lib = pcall(require, "litee.lib")
if not ok then
  vim.notify "Could not load litee.lib"
end

local ok, gh = pcall(require, "litee.gh")
if not ok then
  vim.notify "Could not load litee.gh"
end

lib.setup()
gh.setup()
