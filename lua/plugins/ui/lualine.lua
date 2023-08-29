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
      return client.name
    end)
    :totable()
  local info = table.concat(clients, ", ")
  if info == "" then
    return "No attached LSP server"
  else
    return info
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
