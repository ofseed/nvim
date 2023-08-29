local custom = require "custom"

local which_key_available, which_key = pcall(require, "which-key")
if which_key_available then
  which_key.register {
    ["s"] = { name = "+hop" },
    ["["] = { name = "+prev" },
    ["]"] = { name = "+next" },
    ["g"] = { name = "+goto" },
    ["<leader>"] = {
      name = "+<leader>",
      ["<leader>"] = { name = "+<localleader>" },
      ["f"] = {
        name = "+find",
        ["d"] = { name = "+debug" },
      },
      ["g"] = {
        name = "+git",
        ["d"] = { name = "+diffview" },
      },
      ["s"] = {
        name = "+session",
        ["c"] = { name = "+current" },
      },
      ["b"] = {
        name = custom.prefer_tabpage and "+tab" or "+buffer",
        ["s"] = { name = "+sort" },
      },
      ["l"] = {
        name = "+lsp",
        ["w"] = { name = "+workspace" },
      },
      ["i"] = { name = "+insert" },
      ["m"] = { name = "+manage" },
      ["r"] = { name = "+tasks" },
      ["d"] = { name = "+debug" },
      ["t"] = { name = "+toggle" },
      ["o"] = { name = "+org" },
      ["h"] = { name = "+helper" },
    },
  }
end

local function toggle_quickfix()
  local wins = vim.fn.getwininfo()
  local qf_win = vim
    .iter(wins)
    :filter(function(win)
      return win.quickfix == 1
    end)
    :totable()
  if #qf_win == 0 then
    vim.cmd.copen()
  else
    vim.cmd.cclose()
  end
end

vim.keymap.set("n", "<leader>q", toggle_quickfix, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>tq", toggle_quickfix, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>hi", function()
  vim.show_pos()
end, { desc = "Inspect" })
vim.keymap.set("n", "<leader>ht", function()
  vim.treesitter.inspect_tree()
end, { desc = "Treesitter Tree" })
vim.keymap.set("n", "<leader>hq", function()
  vim.treesitter.preview_query()
end, { desc = "Treesitter Query" })

local filetype_keymaps = vim.api.nvim_create_augroup("ofseed_filetype_keymaps", {})
vim.api.nvim_create_autocmd("Filetype", {
  group = filetype_keymaps,
  pattern = "qf",
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set("n", "q", "<Cmd>cclose<CR>", { buffer = bufnr })
  end,
})
