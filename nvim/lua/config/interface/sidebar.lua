local ok, sidebar = pcall(require, "sidebar-nvim")
if not ok then
  return
end

sidebar.setup {
  disable_default_keybindings = 0,
  bindings = nil,
  open = false,
  side = "left",
  initial_width = 35,
  hide_statusline = false,
  update_interval = 1000,
  section_separator = "-----",
  containers = {
    attach_shell = "/bin/sh",
    show_all = true,
    interval = 5000,
  },
  datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
  todos = { ignored_paths = { "~" } },
  disable_closing_prompt = false,
  sections = {
    "datetime",
    "git",
    "diagnostics",
    require "dap-sidebar-nvim.breakpoints",
  },
  dap = {
    breakpoints = {
      icon = "",
    },
  },
}
