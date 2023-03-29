local ok, navbuddy = pcall(require, "nvim-navbuddy")
if not ok then
  vim.notify "Could not load navbuddy"
end

local actions = require "nvim-navbuddy.actions"

navbuddy.setup {
  window = {
    border = "rounded", -- "rounded", "double", "solid", "none"
    -- or an array with eight chars building up the border in a clockwise fashion
    -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
    size = "60%",
    position = "50%",
    sections = {
      left = {
        size = "20%",
        border = nil, -- You can set border style for each section individually as well.
      },
      mid = {
        size = "40%",
        border = nil,
      },
      right = {
        -- No size option for right most section. It fills to
        -- remaining area.
        border = nil,
      },
    },
  },
  icons = {
    File = " ",
    Module = " ",
    Namespace = " ",
    Package = " ",
    Class = " ",
    Method = " ",
    Property = " ",
    Field = " ",
    Constructor = " ",
    Enum = "練",
    Interface = "練",
    Function = " ",
    Variable = " ",
    Constant = " ",
    String = " ",
    Number = " ",
    Boolean = "◩ ",
    Array = " ",
    Object = " ",
    Key = " ",
    Null = "ﳠ ",
    EnumMember = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
  },
  mappings = {
    ["<esc>"] = actions.close, -- Close and cursor to original location
    ["q"] = actions.close,

    ["j"] = actions.next_sibling, -- down
    ["k"] = actions.previous_sibling, -- up

    ["h"] = actions.parent, -- Move to left panel
    ["l"] = actions.children, -- Move to right panel

    ["v"] = actions.visual_name, -- Visual selection of name
    ["V"] = actions.visual_scope, -- Visual selection of scope

    ["y"] = actions.yank_name, -- Yank the name to system clipboard "+
    ["Y"] = actions.yank_scope, -- Yank the scope to system clipboard "+

    ["i"] = actions.insert_name, -- Insert at start of name
    ["I"] = actions.insert_scope, -- Insert at start of scope

    ["a"] = actions.append_name, -- Insert at end of name
    ["A"] = actions.append_scope, -- Insert at end of scope

    ["r"] = actions.rename, -- Rename currently focused symbol

    ["d"] = actions.delete, -- Delete scope

    ["f"] = actions.fold_create, -- Create fold of current scope
    ["F"] = actions.fold_delete, -- Delete fold of current scope

    ["c"] = actions.comment, -- Comment out current scope

    ["<enter>"] = actions.select, -- Goto selected symbol
    ["o"] = actions.select,
  },
  lsp = {
    auto_attach = true, -- If set to true, you don't need to manually use attach function
    preference = nil, -- list of lsp server names in order of preference
  },
  source_buffer = {
    follow_node = true, -- Keep the current node in focus on the source buffer
    highlight = true, -- Highlight the currently focused node
  },
}

vim.keymap.set("n", "<leader>n", navbuddy.open, { desc = "Navigator" })
