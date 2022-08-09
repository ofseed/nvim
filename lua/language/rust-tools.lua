local ok, tools = pcall(require, "rust-tools")
if not ok then
  vim.notify "Could not load rust-tools"
  return
end

local ok, key = pcall(require, "which-key")
if not ok then
  vim.notify "Could not load which-key"
  return
end

local default = require "language.default"

local extension_path = vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

tools.setup {
  tools = { -- rust-tools options

    -- how to execute terminal commands
    -- options right now: termopen / quickfix
    executor = require("rust-tools/executors").termopen,

    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
    on_initialized = nil,

    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      -- default: true
      auto = true,

      -- Only show inlay hints for the current line
      only_current_line = false,

      -- whether to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,

      -- prefix for parameter hints
      -- default: "<-"
      parameter_hints_prefix = "<- ",

      -- prefix for all the other hints (type, chaining)
      -- default: "=>"
      other_hints_prefix = "=> ",

      -- whether to align to the lenght of the longest line in the file
      max_len_align = false,

      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,

      -- whether to align to the extreme right or not
      right_align = false,

      -- padding from the right if right_align is true
      right_align_padding = 7,

      -- The color of the hints
      highlight = "Comment",
    },

    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {

      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },

      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = false,
    },

    -- settings for showing the crate graph based on graphviz and the dot
    -- command
    crate_graph = {
      -- Backend used for displaying the graph
      -- see: https://graphviz.org/docs/outputs/
      -- default: x11
      backend = "x11",
      -- where to store the output, nil for no output stored (relative
      -- path from pwd)
      -- default: nil
      output = nil,
      -- true for all crates.io and external crates, false only the local
      -- crates
      -- default: true
      full = true,

      -- List of backends found on: https://graphviz.org/docs/outputs/
      -- Is used for input validation and autocompletion
      -- Last updated: 2021-08-26
      enabled_graphviz_backends = {
        "bmp",
        "cgimage",
        "canon",
        "dot",
        "gv",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "ico",
        "cmap",
        "ismap",
        "imap",
        "cmapx",
        "imap_np",
        "cmapx_np",
        "jpg",
        "jpeg",
        "jpe",
        "jp2",
        "json",
        "json0",
        "dot_json",
        "xdot_json",
        "pdf",
        "pic",
        "pct",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tiff",
        "tif",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "xlib",
        "x11",
      },
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    capabilities = default.capabilities,
    on_attach = function(client, bufnr)
      default.on_attach(client, bufnr)
      vim.keymap.set("n", "J", "<cmd>RustJoinLines<CR>", { buffer = bufnr, desc = "Join lines" })

      vim.keymap.set("n", "<leader><leader>r", "<cmd>RustRunnables<CR>", { buffer = bufnr, desc = "Runnables" })
      vim.keymap.set("n", "<leader><leader>d", "<cmd>RustDebuggables<CR>", { buffer = bufnr, desc = "Debugables" })
      vim.keymap.set(
        "n",
        "<leader><leader>R",
        "<cmd>RustReloadWorkspace<CR>",
        { buffer = bufnr, desc = "Reload workspace" }
      )

      vim.keymap.set("n", "<leader><leader>k", "<cmd>RustMoveItemUp<CR>", { buffer = bufnr, desc = "Move item up" })
      vim.keymap.set("n", "<leader><leader>j", "<cmd>RustMoveItemDown<CR>", { buffer = bufnr, desc = "Move item down" })

      vim.keymap.set("n", "<leader><leader>oc", "<cmd>RustOpenCargo<CR>", { buffer = bufnr, desc = "Cargo" })
      vim.keymap.set("n", "<leader><leader>og", "<cmd>RustViewCrateGraph<CR>", { buffer = bufnr, desc = "Crate graph" })
      vim.keymap.set(
        "n",
        "<leader><leader>od",
        "<cmd>RustOpenExternalDocs<CR>",
        { buffer = bufnr, desc = "External docs" }
      )

      vim.keymap.set("n", "<leader><leader>ei", "<cmd>RustEmitIr<CR>", { buffer = bufnr, desc = "IR" })
      vim.keymap.set("n", "<leader><leader>ea", "<cmd>RustEmitAsm<CR>", { buffer = bufnr, desc = "ASM" })

      key.register({
        ["<leader><leader>m"] = { name = "+move" },
        ["<leader><leader>o"] = { name = "+open" },
        ["<leader><leader>e"] = { name = "+emit" },
      }, { buffer = bufnr })
    end,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
    -- standalone file support
    -- setting it to false may improve startup time
    standalone = true,
  }, -- rust-analyer options

  -- debugging stuff
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
}
