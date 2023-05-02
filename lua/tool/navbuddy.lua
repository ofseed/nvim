local ok, navbuddy = pcall(require, "nvim-navbuddy")
if not ok then
  vim.notify "Could not load navbuddy"
end

local actions = require "nvim-navbuddy.actions"

local custom = require "custom"

navbuddy.setup {
  window = {
    border = custom.border, -- "rounded", "double", "solid", "none"
    -- or an array with eight chars building up the border in a clockwise fashion
    -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
    size = "60%", -- Or table format example: { height = "40%", width = "100%"}
    position = "50%", -- Or table format example: { row = "100%", col = "0%"}
    scrolloff = nil, -- scrolloff value within navbuddy window
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
        preview = "leaf", -- Right section can show previews too.
        -- Options: "leaf", "always" or "never"
      },
    },
  },
  icons = {
    Array = " ",
    Boolean = " ",
    Class = " ",
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = " ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = " ",
    Number = " ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = " ",
  },
  use_default_mappings = true, -- If set to false, only mappings set
  -- by user are set. Else default
  -- mappings are used for keys
  -- that are not set by user
  mappings = {
    ["<esc>"] = actions.close, -- Close and cursor to original location
    ["q"] = actions.close,

    ["j"] = actions.next_sibling, -- down
    ["k"] = actions.previous_sibling, -- up

    ["h"] = actions.parent, -- Move to left panel
    ["l"] = actions.children, -- Move to right panel
    ["0"] = actions.root, -- Move to first panel

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

    ["J"] = actions.move_down, -- Move focused node down
    ["K"] = actions.move_up, -- Move focused node up
  },
  lsp = {
    auto_attach = true, -- If set to true, you don't need to manually use attach function
    preference = nil, -- list of lsp server names in order of preference
  },
  source_buffer = {
    follow_node = true, -- Keep the current node in focus on the source buffer
    highlight = true, -- Highlight the currently focused node
    reorient = "smart", -- "smart", "top", "mid" or "none"
    scrolloff = nil, -- scrolloff value when navbuddy is open
  },
}

vim.keymap.set("n", "<leader>n", navbuddy.open, { desc = "Navigator" })
