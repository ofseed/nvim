local lazy_status = require "lazy.status"

local function indent()
  if vim.o.expandtab then
    return "SW:" .. vim.o.shiftwidth
  else
    return "TS:" .. vim.o.tabstop
  end
end

local function lsp()
  local clients = vim.lsp.buf_get_clients()
  if #clients == 0 then
    return ""
  end
  local names = {}
  local ignored = { "null-ls", "copilot" }
  for _, client in ipairs(clients) do
    if not vim.tbl_contains(ignored, client.name) then
      table.insert(names, client.name)
    end
  end
  local msg = table.concat(names, ", ")
  if msg == "" then
    return ""
  else
    return " " .. msg
  end
end

local opts = {
  sections = {
    lualine_c = {
      lsp,
    },
    lualine_x = {
      {
        lazy_status.updates,
        cond = lazy_status.has_updates,
        color = { fg = "#ff9e64" },
      },
      "overseer",
      "copilot",
      indent,
      "encoding",
      "fileformat",
    },
  },
  options = {
    icons_enabled = true,
    theme = "auto",
    disabled_filetypes = {
      statusline = {
        "alpha",
      },
    },
    always_divide_middle = true,
    globalstatus = false,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  extensions = {
    "man",
    "quickfix",
    "nvim-tree",
    "neo-tree",
    "toggleterm",
    "symbols-outline",
    "aerial",
    "fugitive",
    "nvim-dap-ui",
    "mundo",
    "lazy",
  },
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "ofseed/lualine-copilot" },
  },
  opts = opts,
}
