local vim = vim
local toggleterm = require "toggleterm"

toggleterm.setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "horizontal", -- 'vertical' | 'horizontal' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.fn.has "win32" == 1 and "pwsh" or vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    width = 100,
    height = 40,
    winblend = 8,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

local Terminal = require("toggleterm.terminal").Terminal

-- For lazygit
local lazygit = Terminal:new {
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "curved",
  },
}

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

-- For tig
local tig = Terminal:new {
  cmd = "tig",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "curved",
  },
}

function _tig_toggle()
  tig:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _tig_toggle()<CR>", { noremap = true, silent = true })

-- For glow
local glow = Terminal:new { cmd = "glow", direction = "float", float_opts = {
  border = "curved",
} }

function _glow_toggle()
  glow:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _glow_toggle()<CR>", { noremap = true, silent = true })
