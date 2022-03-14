---@diagnostic disable: different-requires
local vim = vim
local packer = require "packer"

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.cmd "packadd packer.nvim"
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return packer.startup {
  function(use)
    -- Core
    use { "wbthomason/packer.nvim" }

    use { "neovim/nvim-lspconfig" }

    use { "williamboman/nvim-lsp-installer" }

    use {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "config.language.null-ls"
      end,
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "neovim/nvim-lspconfig" },
      },
    }

    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require "config.tools.project"
      end,
    }

    use { "tpope/vim-sleuth" }

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "config.language.nvim-treesitter"
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "windwp/nvim-ts-autotag" },
        { "p00f/nvim-ts-rainbow" },
        { "RRethy/nvim-treesitter-endwise" },
        { "RRethy/nvim-treesitter-textsubjects", disable = true },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
      },
    }

    use { "tpope/vim-unimpaired" }

    use {
      "folke/which-key.nvim",
      config = function()
        require "config.interface.which-key"
      end,
    }

    use { "lewis6991/impatient.nvim" }

    use {
      "nathom/filetype.nvim",
      config = function()
        require "config.tools.filetype"
      end,
    }

    -- Text Editing
    use {
      "github/copilot.vim",
      config = function()
        require "edit.copilot"
      end,
    }

    use {
      "hrsh7th/nvim-cmp",
      config = function()
        require "edit.cmp"
      end,
      requires = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/cmp-calc" },
        { "hrsh7th/cmp-nvim-lua" },
        { "kdheepak/cmp-latex-symbols" },
        { "saadparwaiz1/cmp_luasnip" },
        { "kristijanhusak/vim-dadbod-completion" },
        { "lukas-reineke/cmp-under-comparator" },
      },
    }

    use {
      "L3MON4D3/LuaSnip",
      config = function()
        require "edit.luasnip"
      end,
    }

    use { "rafamadriz/friendly-snippets" }

    use {
      "b3nj5m1n/kommentary",
      config = function()
        require "edit.kommentary"
      end,
    }

    use { "tpope/vim-surround" }

    use { "tpope/vim-repeat" }

    use {
      "lewis6991/spellsitter.nvim",
      config = function()
        require "edit.spellsitter"
      end,
      disable = true,
    }

    use {
      "brymer-meneses/grammar-guard.nvim",
      disable = true,
    }

    use {
      "windwp/nvim-autopairs",
      config = function()
        require "edit.autopairs"
      end,
    }

    use { "dhruvasagar/vim-table-mode" }

    use {
      "ekickx/clipboard-image.nvim",
      disable = true,
    }

    -- Interface Extension
    use {
      "akinsho/nvim-bufferline.lua",
      config = function()
        require "interface.bufferline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {
      "nvim-lualine/lualine.nvim",
      config = function()
        require "interface.lualine"
      end,
      requires = {
        { "kyazdani42/nvim-web-devicons" },
        { "ofseed/lualine-copilot" },
        {
          "SmiteshP/nvim-gps",
          requires = "nvim-treesitter/nvim-treesitter",
        },
      },
    }

    use {
      "RRethy/vim-illuminate",
      config = function()
        require "interface.illuminate"
      end,
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "interface.indent-blankline"
      end,
    }

    use {
      "ray-x/lsp_signature.nvim",
      config = function()
        require "interface.lsp_signature"
      end,
    }

    use {
      "onsails/lspkind-nvim",
      config = function()
        require "interface.lspkind"
      end,
    }

    use {
      "weilbith/nvim-code-action-menu",
      cmd = { "CodeActionMenu" },
      disable = true,
    }

    use {
      "goolord/alpha-nvim",
      config = function()
        require "interface.alpha"
      end,
    }

    use {
      "j-hui/fidget.nvim",
      config = function()
        require "interface.fidget"
      end,
    }

    use {
      "rcarriga/nvim-notify",
      config = function()
        require "interface.notify"
      end,
    }

    use {
      "romgrk/nvim-treesitter-context",
      config = function()
        require "interface.treesitter-context"
      end,
    }

    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require "interface.colorizer"
      end,
    }

    use { "dstein64/nvim-scrollview" }

    use {
      "kevinhwang91/nvim-bqf",
      config = function()
        require "interface.bqf"
      end,
    }

    use {
      "folke/todo-comments.nvim",
      config = function()
        require "interface.todo-comments"
      end,
    }

    use {
      "folke/zen-mode.nvim",
      config = function()
        require "interface.zen-mode"
      end,
      cmd = { "ZenMode" },
    }

    use {
      "folke/twilight.nvim",
      config = function()
        require "interface.twilight"
      end,
      cmd = { "Twilight" },
    }

    use {
      "winston0410/range-highlight.nvim",
      config = function()
        require "interface.range-highlight"
      end,
      requires = {
        "winston0410/cmd-parser.nvim",
      },
    }

    use { "psliwka/vim-smoothie" }

    use {
      "edluffy/specs.nvim",
      config = function()
        require "interface.specs"
      end,
      disable = true,
      -- Disable because it's conflicting with the chinese text
    }

    use {
      "chentau/marks.nvim",
      config = function()
        require "interface.marks"
      end,
      disable = true,
    }

    use {
      "edluffy/hologram.nvim",
      disable = true,
    }

    use {
      "jubnzv/virtual-types.nvim",
      disable = true,
      -- Disable because few languages sever support it
    }

    use {
      "bennypowers/nvim-regexplainer",
      config = function()
        require "interface.regexplainer"
      end,
      requires = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
      },
    }

    use {
      "sunjon/Shade.nvim",
      config = function()
        require "interface.shade"
      end,
      disable = true,
      -- Disable because conflict with other floating window plugins
    }

    use {
      "luukvbaal/stabilize.nvim",
      config = function()
        require "interface.stabilize"
      end,
      disable = true,
    }

    use { "folke/tokyonight.nvim" }
    use { "EdenEast/nightfox.nvim" }
    use { "navarasu/onedark.nvim" }
    use { "Mofiqul/vscode.nvim" }
    use { "Mofiqul/dracula.nvim" }
    use { "projekt0n/github-nvim-theme" }
    use { "tanvirtin/monokai.nvim" }
    use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }
    use { "shaunsingh/solarized.nvim" }
    use { "shaunsingh/moonlight.nvim" }
    use { "shaunsingh/nord.nvim" }

    -- Tool Integration
    use {
      "kyazdani42/nvim-tree.lua",
      config = function()
        require "tool.tree"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {
      "sidebar-nvim/sidebar.nvim",
      config = function()
        require "config.interface.sidebar"
      end,
      requires = { "sidebar-nvim/sections-dap" },
      disable = true,
    }

    use {
      "nvim-neo-tree/neo-tree.nvim",
      disable = true,
    }

    use {
      "simrat39/symbols-outline.nvim",
      config = function()
        require "tool.symbols-outline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
      cmd = { "SymbolsOutline" },
      disable = true,
    }

    use {
      "folke/trouble.nvim",
      config = function()
        require "tool.trouble"
      end,
      requires = "kyazdani42/nvim-web-devicons",
      cmd = { "TroubleToggle" },
    }

    use {
      "onsails/diaglist.nvim",
      disable = true,
    }

    use {
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require "tool.toggleterm"
      end,
    }

    use {
      "stevearc/aerial.nvim",
      config = function()
        require "tool.aerial"
      end,
      cmd = { "AerialToggle" },
    }

    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require "tool.gitsigns"
      end,
      requires = "nvim-lua/plenary.nvim",
    }

    use {
      "TimUntersberger/neogit",
      config = function()
        require "tool.neogit"
      end,
      requires = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
      },
      cmd = { "Neogit" },
    }

    use {
      "pwntester/octo.nvim",
      config = function()
        require "tool.octo"
      end,
    }

    use {
      "sindrets/diffview.nvim",
      config = function()
        require "tool.diffview"
      end,
      cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    }

    use {
      "akinsho/git-conflict.nvim",
      disable = true,
    }

    use {
      "tpope/vim-dadbod",
    }

    use { "kristijanhusak/vim-dadbod-ui" }

    use {
      "nvim-orgmode/orgmode",
      config = function()
        require "tool.orgmode"
      end,
    }

    use {
      "akinsho/org-bullets.nvim",
      config = function()
        require "tool.org-bullets"
      end,
    }

    -- Efficiency Improvement
    use {
      "nvim-telescope/telescope.nvim",
      config = function()
        require "efficiency.telescope"
      end,
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-hop.nvim" },
        { "nvim-telescope/telescope-project.nvim" },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-frecency.nvim", requires = "tami5/sql.nvim" },
        { "nvim-telescope/telescope-media-files.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-telescope/telescope-dap.nvim" },
      },
    }

    use {
      "phaazon/hop.nvim",
      config = function()
        require "efficiency.hop"
      end,
    }

    use {
      "mfussenegger/nvim-treehopper",
      config = function()
        require "efficiency.treehopper"
      end,
    }

    use { "roxma/vim-tmux-clipboard" }

    use { "kevinhwang91/vim-ibus-sw" }

    use {
      "ethanholz/nvim-lastplace",
      config = function()
        require "efficiency.lastplace"
      end,
    }

    use {
      "Shatur/neovim-session-manager",
      config = function()
        require "efficiency.session-manager"
      end,
      requires = {
        { "nvim-lua/plenary.nvim" },
      },
    }

    use {
      "dstein64/vim-startuptime",
      cmd = { "StartupTime" },
    }
    use {
      "t9md/vim-choosewin",
      disable = true,
    }

    -- Language Specific
    use {
      "simrat39/rust-tools.nvim",
    }

    use {
      "Saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require "config.tools.crates"
      end,
    }

    use {
      "p00f/clangd_extensions.nvim",
    }

    use {
      "Shatur/neovim-cmake",
      config = function()
        require "config.language.neovim-cmake"
      end,
    }

    use {
      "mfussenegger/nvim-jdtls",
      config = function()
        require "config.language.nvim-jdtls"
      end,
      ft = { "java" },
      disable = true,
    }

    use {
      "mfussenegger/nvim-dap-python",
      config = function()
        require "config.language.nvim-dap-python"
      end,
    }

    use {
      "akinsho/flutter-tools.nvim",
      disable = true,
    }

    use {
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      disable = true,
    }

    use {
      "vuki656/package-info.nvim",
      config = function()
        require "config.tools.package-info"
      end,
      requires = "MunifTanjim/nui.nvim",
      ft = { "json" },
    }

    use {
      "lervag/vimtex",
      config = function()
        require "config.tools.vimtex"
      end,
      ft = { "tex" },
    }

    use {
      "jbyuki/nabla.nvim",
      config = function()
        require "config.tools.nabla"
      end,
      ft = { "tex", "markdown" },
    }

    use {
      "plasticboy/vim-markdown",
      ft = { "markdown" },
    }

    use {
      "iamcco/markdown-preview.nvim",
      config = function()
        require "config.tools.markdown-preview"
      end,
      run = "cd app && yarn install",
      ft = { "markdown" },
    }

    -- Debug And Run
    use {
      "michaelb/sniprun",
      config = function()
        require "debug.sniprun"
      end,
      run = "bash install.sh",
    }

    use {
      "rafcamlet/nvim-luapad",
      disable = true,
    }

    use {
      "mfussenegger/nvim-dap",
      config = function()
        require "debug.dap"
      end,
    }

    use {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require "debug.dap-virtual-text"
      end,
    }

    use {
      "rcarriga/nvim-dap-ui",
      config = function()
        require "debug.dap-ui"
      end,
    }

    use {
      "Pocco81/DAPInstall.nvim",
      config = function()
        require "debug.dap-install"
      end,
    }
  end,

  config = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
  },
}
