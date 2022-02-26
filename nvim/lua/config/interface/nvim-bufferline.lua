local vim = vim
local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = "▎",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match "%.md" then
        return vim.fn.fnamemodify(buf.name, ":t:r")
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "(" .. count .. ")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number, buf_numbers)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
      -- filter out by it's index number in list (don't show first buffer)
      if buf_numbers[1] ~= buf_number then
        return true
      end
    end,
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", text_align = "center" },
      { filetype = "Outline", text = "Outline", text_align = "center" },
      { filetype = "aerial", text = "Outline", text_align = "center" },
      { filetype = "packer", text = "Plugin Manager", text_align = "center" },
      { filetype = "dbui", text = "Database Manager", text_align = "center" },
      { filetype = "SidebarNvim", text = "Sidebar", text_align = "center" },
    },
    show_buffer_icons = true, -- true | false, -- disable filetype icons for buffers
    show_buffer_close_icons = true, -- true | false,
    show_close_icon = false, -- true | false,
    show_tab_indicators = true, -- true | false,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = false, -- false | true,
    always_show_bufferline = true, -- true | false,
    sort_by = "id", -- 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  },
}

vim.api.nvim_set_keymap("n", "]b", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gb", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>be", "<cmd>BufferLineSortByExtension<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bd", "<cmd>BufferLineSortByDirectory<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bt", "<cmd>BufferLineSortByTabs<CR>", { noremap = true, silent = true })
