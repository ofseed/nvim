local lazy_status = require "lazy.status"

local function indent()
  if vim.o.expandtab then
    return "SW:" .. vim.o.shiftwidth
  else
    return "TS:" .. vim.o.tabstop
  end
end

local function lsp()
  local clients = vim.lsp.get_clients()
  local buf = vim.api.nvim_get_current_buf()
  clients = vim
    .iter(clients)
    :filter(function(client)
      return client.attached_buffers[buf]
    end)
    :filter(function(client)
      return client.name ~= "copilot"
    end)
    :map(function(client)
      return " " .. client.name
    end)
    :totable()
  local info = table.concat(clients, " ")
  if info == "" then
    return "No attached LSP server"
  else
    return info
  end
end

local function dap()
  ---@diagnostic disable-next-line: redefined-local
  local dap = package.loaded["dap"]
  if dap then
    return dap.status()
  end
  return ""
end

local function osv()
  ---@diagnostic disable-next-line: redefined-local
  local osv = package.loaded["osv"]
  if osv and osv.is_running() then
    return "Running as debuggee"
  end
  return ""
end

local function dap_or_lsp()
  if osv() ~= "" then
    return osv()
  elseif dap() ~= "" then
    return dap()
  else
    return lsp()
  end
end

local function recording()
  local reg = vim.fn.reg_recording()
  if reg ~= "" then
    return "recording @" .. reg
  end
  reg = vim.fn.reg_recorded()
  if reg ~= "" then
    return "recorded @" .. reg
  end

  return ""
end

local opts = {
  sections = {
    lualine_b = {
      {
        "branch",
        icon = "",
      },
      {
        "diff",
        symbols = {
          added = " ",
          modified = " ",
          removed = " ",
        },
        source = function()
          return vim.b.gitsigns_status_dict
        end,
      },
    },
    lualine_c = {
      dap_or_lsp,
    },
    lualine_x = {
      recording,
      {
        lazy_status.updates,
        cond = lazy_status.has_updates,
        color = { fg = "#ff9e64" },
      },
      {
        name = "overseer-placeholder",
        function()
          return ""
        end,
      },
      "copilot",
      indent,
      "encoding",
      "fileformat",
    },
    lualine_y = {
      "diagnostics",
      "progress",
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
  init = function()
    vim.o.laststatus = 0
  end,
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "ofseed/lualine-copilot" },
  },
  opts = opts,
}
