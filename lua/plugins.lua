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

  -- Text Editing {{{
  {
    "github/copilot.vim",
    config = function()
      require "edit.copilot"
    end,
    event = "VeryLazy",
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "edit.cmp"
    end,
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-calc" },
      { "saadparwaiz1/cmp_luasnip" },
      { "kristijanhusak/vim-dadbod-completion" },
      { "lukas-reineke/cmp-under-comparator" },
    },
    event = "VeryLazy",
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require "edit.snip"
    end,
    event = "VeryLazy",
  },

  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require "edit.comment"
    end,
    event = "VeryLazy",
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require "edit.surround"
    end,
    event = "VeryLazy",
  },

  {
    "RaafatTurki/hex.nvim",
    config = function()
      require "edit.hex"
    end,
  },

  {
    "brymer-meneses/grammar-guard.nvim",
    enabled = false,
    -- Now grammar check is provided by ltex languages server
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require "edit.autopairs"
    end,
    event = "VeryLazy",
  },

  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown", "org" },
  },

  {
    "ekickx/clipboard-image.nvim",
    enabled = false,
  },

  {
    "ThePrimeagen/refactoring.nvim",
    config = function()
      require "edit.refactoring"
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    enabled = false,
    -- Plugin surpporting refactorings
    -- Disable because it needs neovim nightly
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

  -- Colorscheme {{{
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require "colorscheme.catppuccin"
    end,
    build = ":CatppuccinCompile",
  },

  {
    "akinsho/horizon.nvim",
    config = function()
      require "colorscheme.horizon"
    end,
  },

  {
    "folke/tokyonight.nvim",
    config = function()
      require "colorscheme.tokyonight"
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require "colorscheme.rose-pine"
    end,
  },

  {
    "EdenEast/nightfox.nvim",
    config = function()
      require "colorscheme.nightfox"
    end,
  },

  {
    "projekt0n/github-nvim-theme",
    config = function()
      require "colorscheme.github"
    end,
  },

  {
    "navarasu/onedark.nvim",
    config = function()
      require "colorscheme.onedark"
    end,
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
  },

  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require "colorscheme.gruvbox"
    end,
  },
  -- }}}

  -- Tool Integration {{{
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "tool.tree"
    end,
    dependencies = { "kyazdani42/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" },
    },
    enabled = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require "tool.neo-tree"
    end,
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker",
    },
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require "tool.symbols-outline"
    end,
    dependencies = { "kyazdani42/nvim-web-devicons" },
    cmd = { "SymbolsOutline" },
    enabled = false,
    -- Subtitute for aerial.nvim
    -- Disable because better to , aerial.nvim
  },

  {
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require "tool.toggleterm"
    end,
    version = "*",
    event = "VeryLazy",
  },

  {
    "stevearc/aerial.nvim",
    config = function()
      require "tool.aerial"
    end,
    keys = {
      { "<leader>a", "<Cmd>AerialToggle<CR>", desc = "Outline" },
    },
  },

  {
    "SmiteshP/nvim-navbuddy",
    config = function()
      require "tool.navbuddy"
    end,
    event = "VeryLazy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
  },

  {
    "gorbit99/codewindow.nvim",
    config = function()
      require "tool.codewindow"
    end,
    enabled = false,
  },

  {
    "s1n7ax/nvim-window-picker",
    version = "*",
    config = function()
      require "tool.window-picker"
    end,
    event = "VeryLazy",
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "tool.gitsigns"
    end,
    dependencies = "nvim-lua/plenary.nvim",
    -- Lasy load cause error
  },

  {
    "akinsho/git-conflict.nvim",
    config = function()
      require "tool.git-conflict"
    end,
    event = "VeryLazy",
  },

  {
    "NeogitOrg/neogit",
    config = function()
      require "tool.neogit"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    keys = {
      { "<leader>gg", "<Cmd>Neogit<CR>", desc = "Open Neogit" },
    },
  },

  {
    "sindrets/diffview.nvim",
    config = function()
      require "tool.diffview"
    end,
    event = "VeryLazy",
  },

  {
    "ruifm/gitlinker.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require "tool.gitlinker"
    end,
    event = "VeryLazy",
  },

  {
    "Rawnly/gist.nvim",
    event = "VeryLazy",
  },

  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },

  {
    "rbong/vim-flog",
    event = "VeryLazy",
  },

  {
    "simnalamburt/vim-mundo",
    config = function()
      require "tool.mundo"
    end,
    keys = {
      { "<leader>u", "<Cmd>MundoToggle<CR>", desc = "Undo Tree" },
    },
    event = "VeryLazy",
  },

  {
    "kevinhwang91/nvim-fundo",
    requires = "kevinhwang91/promise-async",
    run = function()
      require("fundo").install()
    end,
    config = function()
      require "tool.fundo"
    end,
    enabled = false,
  },

  {
    "aserowy/tmux.nvim",
    config = function()
      require "tool.tmux"
    end,
    event = "VeryLazy",
  },

  {
    "iamcco/markdown-preview.nvim",
    config = function()
      require "tool.markdown-preview"
    end,
    build = "cd app && yarn install",
    ft = { "markdown" },
  },

  {
    "Saecki/crates.nvim",
    config = function()
      require "tool.crates"
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufRead Cargo.toml" },
  },

  {
    "vuki656/package-info.nvim",
    config = function()
      require "tool.package-info"
    end,
    dependencies = "MunifTanjim/nui.nvim",
    event = {
      "BufRead package.json",
      "BufRead package-lock.json",
    },
  },

  {
    "pwntester/octo.nvim",
    config = function()
      require "tool.octo"
    end,
    cmd = { "Octo" },
    enabled = false,
    -- Subtitute for gh.nvim
    -- Disable beca, better to , gh.nvim
  },

  {
    "ldelossa/gh.nvim",
    config = function()
      require "tool.gh"
    end,
    dependencies = "ldelossa/litee.nvim",
    enabled = false,
    -- Disable since it could not work properly
  },

  {
    "tpope/vim-dadbod",
    enabled = false,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUIToggle" },
    enabled = false,
  },

  {
    "nvim-orgmode/orgmode",
    config = function()
      require "tool.orgmode"
    end,
    event = "VeryLazy",
  },

  {
    "akinsho/org-bullets.nvim",
    config = function()
      require "tool.org-bullets"
    end,
    ft = { "org" },
  },

  {
    "lalitmee/browse.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    enabled = false,
  },

  {
    "rest-nvim/rest.nvim",
    config = function()
      require "tool.rest"
    end,
    ft = { "http" },
  },

  {
    "martineausimon/nvim-lilypond-suite",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require "tool.lilypond-suite"
    end,
    ft = { "lilypond" },
  },
  -- }}}

  -- Efficiency Improvement {{{
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "efficiency.telescope"
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "nvim-telescope/telescope-hop.nvim" },
      { "nvim-telescope/telescope-project.nvim" },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "nvim-telescope/telescope-dap.nvim" },
      { "benfowler/telescope-luasnip.nvim" },
    },
    branch = "0.1.x",
    event = "VeryLazy",
  },

  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
    event = "VeryLazy",
  },

  {
    "phaazon/hop.nvim",
    config = function()
      require "efficiency.hop"
    end,
    branch = "v2",
    event = "VeryLazy",
    enabled = false,
    -- Replace with flash
  },

  {
    "folke/flash.nvim",
    config = function()
      require "efficiency.flash"
    end,
    event = "VeryLazy",
  },

  {
    "mfussenegger/nvim-treehopper",
    config = function()
      require "efficiency.treehopper"
    end,
    event = "VeryLazy",
  },

  {
    "kevinhwang91/vim-ibus-sw",
    event = "VeryLazy",
  },

  {
    "Pocco81/auto-save.nvim",
    config = function()
      require "efficiency.auto-save"
    end,
    enabled = false,
    -- Disable because it could not be enabled manually
  },

  {
    "ethanholz/nvim-lastplace",
    config = function()
      require "efficiency.lastplace"
    end,
  },

  {
    "Shatur/neovim-session-manager",
    config = function()
      require "efficiency.session-manager"
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    event = "VeryLazy",
  },

  {
    "chrisgrieser/nvim-spider",
    config = function()
      require "efficiency.spider"
    end,
    event = "VeryLazy",
    enabled = false,
    -- Disable because it conflicts with chinese characters
  },

  {
    "monaqa/dial.nvim",
    config = function()
      require "efficiency.dial"
    end,
    event = "VeryLazy",
  },

  {
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" },
  },

  {
    "sindrets/winshift.nvim",
    enabled = false,
  },

  {
    "willothy/flatten.nvim",
    config = function()
      require "efficiency.flatten"
    end,
  },

  {
    "jcdickinson/wpm.nvim",
    enabled = false,
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
