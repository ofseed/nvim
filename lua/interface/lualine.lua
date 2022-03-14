local vim = vim
local ok, lualine = pcall(require, "lualine")
if not ok then
  vim.notify "Could not load lualine"
  return
end

local ok, gps = pcall(require, "nvim-gps")
if not ok then
  vim.notify "Could not load gps"
  return
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local function indent()
  if vim.o.expandtab then
    return "SW:" .. vim.o.shiftwidth
  else
    return "TS:" .. vim.o.tabstop
  end
end

gps.setup {
  icons = {
    ["class-name"] = " ", -- Classes and class-like objects
    ["function-name"] = " ", -- Functions
    ["method-name"] = " ", -- Methods (functions inside class-like objects)
    ["container-name"] = "⛶ ", -- Containers (example: lua tables)
    ["tag-name"] = " ", -- Tags (example: html tags)
  },
  -- Add custom configuration per language or
  -- Disable the plugin for a language
  -- Any language not disabled here is enabled by default
  languages = {
    -- ["bash"] = false, -- disables nvim-gps for bash
    -- ["go"] = false,   -- disables nvim-gps for golang
    -- ["ruby"] = {
    --	separator = '|', -- Overrides default separator with '|'
    --	icons = {
    --		-- Default icons not specified in the lang config
    --		-- will fallback to the default value
    --		-- "container-name" will fallback to default because it's not set
    --		["function-name"] = '',    -- to ensure empty values, set an empty string
    --		["tag-name"] = ''
    --		["class-name"] = '::',
    --		["method-name"] = '#',
    --	}
    --}
  },
  separator = " > ",
  -- limit for amount of context shown
  -- 0 means no limit
  -- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
  -- in context names (eg: function names, class names, etc)
  depth = 0,
  -- indicator used when context is hits depth limit
  depth_limit_indicator = "..",
}

lualine.setup {
  sections = {
    lualine_b = {
      { "b:gitsigns_head", icon = "" },
      { "diff", source = diff_source },
      "diagnostics",
    },
    lualine_c = {
      { gps.get_location, cond = gps.is_available },
    },
    lualine_x = {
      "copilot",
      "filetype",
      indent,
      "encoding",
      "fileformat",
    },
  },
  options = {
    theme = vim.g.colors_name,
    disabled_filetypes = {
      "alpha",
    },
    section_separators = "",
    component_separators = "│",
  },
  extensions = {
    "nvim-tree",
    "toggleterm",
    "symbols-outline",
    "aerial",
  },
}
