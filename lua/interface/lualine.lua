local ok, lualine = pcall(require, "lualine")
if not ok then
  vim.notify "Could not load lualine"
  return
end

local ok, navic = pcall(require, "nvim-navic")
if not ok then
  vim.notify "Could not load navic"
end

local function indent()
  if vim.o.expandtab then
    return "SW:" .. vim.o.shiftwidth
  else
    return "TS:" .. vim.o.tabstop
  end
end

local function is_file()
  return vim.bo.buftype ~= "nofile"
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

lualine.setup {
  sections = {
    lualine_c = {
      lsp,
    },
    lualine_x = {
      "copilot",
      "filetype",
      indent,
      "encoding",
      "fileformat",
    },
  },
  inactive_sections = {
    lualine_c = {
      lsp,
    },
  },
  winbar = {
    lualine_b = {
      { "filename", cond = is_file },
    },
    lualine_c = {
      { navic.get_location, cond = navic.is_available },
    },
  },
  inactive_winbar = {
    lualine_b = {
      { "filename", cond = is_file },
    },
  },
  options = {
    icons_enabled = true,
    theme = "auto",
    disabled_filetypes = {
      statusline = {
        "alpha",
      },
      winbar = {
        "toggleterm",
        "dap-repl",
      },
    },
    always_divide_middle = true,
    globalstatus = false,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  extensions = {
    "man",
    "nvim-tree",
    "neo-tree",
    "toggleterm",
    "symbols-outline",
    "aerial",
    "nvim-dap-ui",
  },
}
