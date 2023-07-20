local opts = {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    -- style_preset = bufferline.presets.default, -- or bufferline.presets.minimal,
    themable = true, -- true | false, -- allows highlight groups to be overriden i.e. sets highlights as default
    numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
    indicator = {
      icon = "▎", -- this should be omitted if indicator style is not 'icon'
      style = "icon", -- "icon" | "underline" | "none",
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = nil, -- function(buf) -- buf contains:
    -- name                | str        | the basename of the active file
    -- path                | str        | the full path of the active file
    -- bufnr (buffer only) | int        | the number of the active buffer
    -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
    -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
    -- end,
    max_name_length = 24,
    max_prefix_length = 20, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "(" .. count .. ")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number, buf_numbers)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "qf" then
        return true
      end
      -- filter out by buffer name
      -- if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
      -- return true
      -- end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      -- if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
      -- return true
      -- end
      -- filter out by it's index number in list (don't show first buffer)
      -- if buf_numbers[1] ~= buf_number then
      -- return true
      -- end
    end,
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", text_align = "center", saperator = true },
      { filetype = "Outline", text = "Outline", text_align = "center", saperator = true },
      { filetype = "neo-tree", text = "Explorer", text_align = "center", saperator = true },
      { filetype = "aerial", text = "Outline", text_align = "center", saperator = true },
      { filetype = "packer", text = "Plugin Manager", text_align = "center", saperator = true },
      { filetype = "dbui", text = "Database Manager", text_align = "center", saperator = true },
      { filetype = "SidebarNvim", text = "Sidebar", text_align = "center", saperator = true },
      { filetype = "httpResult", text = "Http Result", text_align = "center", saperator = true },
      { filetype = "OverseerList", text = "Tasks", text_align = "center", saperator = true },
      { filetype = "flutterToolsOutline", text = "Flutter Outline", text_align = "center", saperator = true },
    },
    color_icons = true, -- true | false, -- whether or not to add the filetype icon highlights
    get_element_icon = nil, -- function(element)
    -- element consists of {filetype: string, path: string, extension: string, directory: string}
    -- This can be used to change how bufferline fetches the icon
    -- for an element e.g. a buffer or a tab.
    -- e.g.
    -- local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
    -- return icon, hl
    -- or
    -- local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
    -- return custom_map[element.filetype]
    -- end,
    show_buffer_icons = true, -- true | false, -- disable filetype icons for buffers
    show_buffer_close_icons = true, -- true | false,
    show_close_icon = false, -- true | false,
    show_tab_indicators = true, -- true | false,
    show_duplicate_prefix = true, -- true | false, -- whether to show duplicate buffer prefix
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = false, -- false | true,
    always_show_bufferline = true, -- true | false,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { "close" },
    },
    sort_by = "id", -- 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  },
}

return {
  "akinsho/nvim-bufferline.lua",
  version = "*",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    require("bufferline").setup(opts)
    vim.keymap.set("n", "<M-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
    vim.keymap.set("n", "<M-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
    vim.keymap.set("n", "<M-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })
    vim.keymap.set("n", "<M-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" })
    vim.keymap.set("n", "<M-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5" })
    vim.keymap.set("n", "<M-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to buffer 6" })
    vim.keymap.set("n", "<M-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to buffer 7" })
    vim.keymap.set("n", "<M-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "Go to buffer 8" })
    vim.keymap.set("n", "<M-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "Go to buffer 9" })

    vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<CR>", { desc = "Buffer" })
    vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Buffer" })

    vim.keymap.set("n", "gb", "<cmd>BufferLinePick<CR>", { desc = "Buffer" })

    vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Close" })
    vim.keymap.set("n", "<leader>bse", "<cmd>BufferLineSortByExtension<CR>", { desc = "By extension" })
    vim.keymap.set("n", "<leader>bsd", "<cmd>BufferLineSortByDirectory<CR>", { desc = "By directory" })
    vim.keymap.set("n", "<leader>bst", "<cmd>BufferLineSortByTabs<CR>", { desc = "By tabs" })
  end,
}
