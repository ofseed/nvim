-- vim:foldmethod=marker
---@diagnostic disable: different-requires

return {
  -- Core {{{
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "core.lspconfig"
    end,
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    after = "mason.nvim",
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require "core.mason"
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "core.null-ls"
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "jay-babu/mason-null-ls.nvim" },
    },
    event = "VeryLazy",
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require "core.project"
    end,
    event = "VeryLazy",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "core.treesitter"
    end,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "windwp/nvim-ts-autotag" },
      { "mrjones2014/nvim-ts-rainbow", enabled = false },
      { "RRethy/nvim-treesitter-endwise" },
      { "RRethy/nvim-treesitter-textsubjects", enabled = false },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
    event = "VeryLazy",
  },

  {
    "stevearc/overseer.nvim",
    config = function()
      require "core.overseer"
    end,
    event = "VeryLazy",
  },

  {
    "tpope/vim-sleuth",
    event = "VeryLazy",
  },

  {
    "folke/which-key.nvim",
    config = function()
      require "core.which-key"
    end,
    event = "VeryLazy",
  },

  {
    "linty-org/key-menu.nvim",
    enabled = false,
    -- Alternative to which-key.nvim
  },

  {
    "b0o/mapx.nvim",
    enabled = false,
    -- Plugin organize keymaps
    -- Disable because lots of refactorings needs to be done
  },

  {
    "ii14/emmylua-nvim",
    lazy = true,
  },
  -- }}}

  -- Interface Extension {{{
  {
    "stevearc/stickybuf.nvim",
    enabled = false,
    -- Disable because it brings a more buggy behavior
    -- https://github.com/neovim/neovim/issues/12517
  },

  {
    "folke/noice.nvim",
    config = function()
      require "interface.noice"
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  {
    "akinsho/nvim-bufferline.lua",
    config = function()
      require "interface.bufferline"
    end,
    version = "*",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "interface.lualine"
    end,
    dependencies = {
      { "kyazdani42/nvim-web-devicons" },
      { "ofseed/lualine-copilot" },
    },
  },

  {
    "utilyre/barbecue.nvim",
    config = function()
      require "interface.barbecue"
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "kyazdani42/nvim-web-devicons",
    },
  },

  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require "interface.statuscol"
    end,
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require "interface.illuminate"
    end,
    event = "VeryLazy",
  },

  {
    "kevinhwang91/nvim-ufo",
    config = function()
      require "interface.ufo"
    end,
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
  },

  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require "interface.lsp-inlayhints"
    end,
    event = "VeryLazy",
    branch = "anticonceal",
    -- Inlay hints now provided by nvim-lsp
    enabled = false,
  },

  {
    "VidocqH/lsp-lens.nvim",
    config = function()
      require "interface.lsp-lens"
    end,
    enabled = false,
    -- Not stable
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "interface.indent-blankline"
    end,
    event = "VeryLazy",
  },

  {
    "stevearc/dressing.nvim",
    config = function()
      require "interface.dressing"
    end,
    event = "VeryLazy",
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require "interface.lsp_signature"
    end,
    event = "VeryLazy",
  },

  {
    "onsails/lspkind-nvim",
    config = function()
      require "interface.lspkind"
    end,
    event = "VeryLazy",
  },

  {
    "weilbith/nvim-code-action-menu",
    cmd = { "CodeActionMenu" },
    enabled = false,
    -- Disable because it not stable
  },

  {
    "goolord/alpha-nvim",
    config = function()
      require "interface.alpha"
    end,
  },

  {
    "j-hui/fidget.nvim",
    config = function()
      require "interface.fidget"
    end,
    event = "VeryLazy",
    branch = "legacy",
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require "interface.notify"
    end,
  },

  {
    "uga-rosa/ccc.nvim",
    config = function()
      require "interface.ccc"
    end,
    enabled = false,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "interface.colorizer"
    end,
    event = "VeryLazy",
  },

  {
    "dstein64/nvim-scrollview",
    event = "VeryLazy",
    enabled = false,
  },

  {
    "lewis6991/satellite.nvim",
    config = function()
      require "interface.satellite"
    end,
    -- A substitue for nvim-scrollview
    -- which support search resultsuse lsp diagnostics and git hunks
    -- Disable because it's work in progress
  },

  {
    "utilyre/sentiment.nvim",
    config = function()
      require "interface.sentiment"
    end,
    event = "VeryLazy",
  },

  {
    "kevinhwang91/nvim-bqf",
    config = function()
      require "interface.bqf"
    end,
    event = "VeryLazy",
  },

  {
    "folke/todo-comments.nvim",
    config = function()
      require "interface.todo-comments"
    end,
    event = "VeryLazy",
  },

  {
    "folke/zen-mode.nvim",
    config = function()
      require "interface.zen-mode"
    end,
    keys = {
      { "<leader>tz", "<Cmd>ZenMode<CR>", desc = "Zen Mode" },
    },
  },

  {
    "edluffy/specs.nvim",
    config = function()
      require "interface.specs"
    end,
    enabled = false,
    -- Disable because it's conflicting with the chinese text
  },

  {
    "chentoast/marks.nvim",
    config = function()
      require "interface.marks"
    end,
    event = "VeryLazy",
  },

  {
    "edluffy/hologram.nvim",
    enabled = false,
  },

  {
    "bennypowers/nvim-regexplainer",
    config = function()
      require "interface.regexplainer"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    enabled = false,
    -- Not very useful now
  },

  {
    "jbyuki/nabla.nvim",
    config = function()
      require "interface.nabla"
    end,
    ft = { "tex", "markdown" },
  },

  {
    "sunjon/Shade.nvim",
    config = function()
      require "interface.shade"
    end,
    enabled = false,
    -- Disable because conflict with other floating window plugins
  },
  -- }}}

  -- Debug And Run {{{
  {
    "michaelb/sniprun",
    config = function()
      require "debug.sniprun"
    end,
    build = "bash install.sh",
    event = "VeryLazy",
  },

  {
    "rcarriga/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    enabled = false,
  },

  {
    "rafcamlet/nvim-luapad",
    enabled = false,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "debug.dap"
    end,
    event = "VeryLazy",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
    },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require "debug.dap-virtual-text"
    end,
    event = "VeryLazy",
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require "debug.dap-ui"
    end,
    requires = {
      "mfussenegger/nvim-dap",
    },
    event = "VeryLazy",
  },

  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require "debug.dap-python"
    end,
    ft = { "python" },
  },

  {
    "Civitasv/cmake-tools.nvim",
    enabled = false,
  },
  -- }}}

  -- Language Specific {{{
  {
    "lervag/vimtex",
    config = function()
      require "language.tex"
    end,
    ft = { "tex" },
  },

  {
    "plasticboy/vim-markdown",
    ft = { "markdown" },
  },

  {
    "jakewvincent/mkdnflow.nvim",
    enabled = false,
  },

  {
    "p00f/clangd_extensions.nvim",
    config = function()
      require "language.clangd_extensions"
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    config = function()
      require "language.rust-tools"
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    config = function()
      require "language.jdtls"
    end,
  },

  {
    "ray-x/go.nvim",
    config = function()
      require "language.go"
    end,
    dependencies = {
      "ray-x/guihua.lua",
    },
  },

  {
    "akinsho/flutter-tools.nvim",
    config = function()
      require "language.flutter-tools"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require "language.typescript"
    end,
  },

  {
    "b0o/SchemaStore.nvim",
    config = function()
      require "language.schema-store"
    end,
  },

  {
    "nanotee/sqls.nvim",
    enabled = false,
  },

  {
    "fladson/vim-kitty",
    event = { "BufRead kitty.conf" },
  },
  -- }}}
}
