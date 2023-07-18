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
