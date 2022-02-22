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
    use { "wbthomason/packer.nvim" }

    -- Interface Plugins
    use {
      "akinsho/nvim-bufferline.lua",
      config = function()
        require "config.interface.nvim-bufferline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {
      "nvim-lualine/lualine.nvim",
      config = function()
        require "config.interface.lualine"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {
      "1478zhcy/lualine-copilot",
    }

    use {
      "SmiteshP/nvim-gps",
      config = function()
        require "config.interface.nvim-gps"
      end,
      requires = "nvim-treesitter/nvim-treesitter",
    }

    use {
      "j-hui/fidget.nvim",
      config = function()
        require "config.interface.fidget"
      end,
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
      "kyazdani42/nvim-tree.lua",
      config = function()
        require "config.interface.nvim-tree"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {
      "nvim-neo-tree/neo-tree.nvim",
      disable = true,
    }

    use {
      "simrat39/symbols-outline.nvim",
      config = function()
        require "config.interface.symbols-outline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
      cmd = { "SymbolsOutline" },
      disable = true,
    }

    use {
      "stevearc/aerial.nvim",
      config = function()
        require "config.interface.aerial"
      end,
      cmd = { "AerialToggle" },
    }

    use {
      "goolord/alpha-nvim",
      config = function()
        require "config.interface.alpha-nvim"
      end,
    }

    use {
      "winston0410/range-highlight.nvim",
      config = function()
        require("range-highlight").setup {}
      end,
      requires = {
        "winston0410/cmd-parser.nvim",
      },
    }

    use {
      "chentau/marks.nvim",
      config = function()
        require "config.interface.marks"
      end,
      disable = true,
    }

    use {
      "folke/which-key.nvim",
      config = function()
        require "config.interface.which-key"
      end,
    }

    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require "config.interface.gitsigns"
      end,
      requires = "nvim-lua/plenary.nvim",
    }

    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require "config.interface.nvim-colorizer"
      end,
    }

    use {
      "jubnzv/virtual-types.nvim",
      disable = true,
    }

    use {
      "folke/trouble.nvim",
      config = function()
        require "config.interface.trouble"
      end,
      requires = "kyazdani42/nvim-web-devicons",
      cmd = { "TroubleToggle" },
    }

    use {
      "onsails/diaglist.nvim",
      disable = true,
    }

    use {
      "kevinhwang91/nvim-bqf",
      config = function()
        require "config.interface.nvim-bqf"
      end,
    }

    use {
      "folke/todo-comments.nvim",
      config = function()
        require "config.interface.todo-comments"
      end,
    }

    use {
      "folke/zen-mode.nvim",
      config = function()
        require "config.interface.zen-mode"
      end,
      cmd = { "ZenMode" },
    }

    use {
      "folke/twilight.nvim",
      config = function()
        require "config.interface.twilight"
      end,
      cmd = { "Twilight" },
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "config.interface.indent-blankline"
      end,
    }

    use {
      "rcarriga/nvim-notify",
      config = function()
        require "config.interface.nvim-notify"
      end,
    }

    use {
      "edluffy/specs.nvim",
      config = function()
        require "config.interface.specs"
      end,
      disable = true,
      -- Disable because it's conflicting with the chinese text
    }

    use {
      "romgrk/nvim-treesitter-context",
      config = function()
        require "config.interface.nvim-treesitter-context"
      end,
    }

    use {
      "sunjon/Shade.nvim",
      config = function()
        require "config.interface.shade"
      end,
      disable = true,
    }

    use {
      "edluffy/hologram.nvim",
      disable = true,
    }

    use { "dstein64/nvim-scrollview" }

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

    -- Tools Plugins
    use {
      "nathom/filetype.nvim",
      config = function()
        require "config.tools.filetype"
      end,
    }

    use {
      "lewis6991/impatient.nvim",
    }

    use {
      "luukvbaal/stabilize.nvim",
      config = function()
        require "config.tools.stabilize"
      end,
      disable = true,
    }

    use {
      "windwp/nvim-autopairs",
      config = function()
        require "config.tools.nvim-autopairs"
      end,
    }

    use {
      "RRethy/vim-illuminate",
      config = function()
        require "config.tools.vim-illuminate"
      end,
    }

    use {
      "b3nj5m1n/kommentary",
      config = function()
        require "config.tools.kommentary"
      end,
    }

    use {
      "kevinhwang91/vim-ibus-sw",
    }

    use {
      "mfussenegger/nvim-treehopper",
      config = function()
        require "config.tools.nvim-treehopper"
      end,
    }

    use {
      "nvim-orgmode/orgmode",
      config = function()
        require "config.tools.orgmode"
      end,
    }

    use {
      "akinsho/org-bullets.nvim",
    }

    use {
      "nvim-telescope/telescope.nvim",
      config = function()
        require "config.tools.telescope"
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
      "ahmedkhalf/project.nvim",
      config = function()
        require "config.tools.project"
      end,
    }

    use {
      "iamcco/markdown-preview.nvim",
      config = function()
        require "config.tools.markdown-preview"
      end,
      run = "cd app && yarn install",
      ft = { "markdown" },
    }

    use {
      "jbyuki/nabla.nvim",
      config = function()
        require "config.tools.nabla"
      end,
      ft = { "tex", "markdown" },
    }

    use {
      "lervag/vimtex",
      config = function()
        require "config.tools.vimtex"
      end,
      ft = { "tex" },
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
      "Saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require "config.tools.crates"
      end,
    }

    use {
      "sindrets/diffview.nvim",
      config = function()
        require "config.tools.diffview"
      end,
      cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    }

    use {
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require "config.tools.nvim-toggleterm"
      end,
    }

    use {
      "plasticboy/vim-markdown",
      ft = { "markdown" },
    }

    use { "dhruvasagar/vim-table-mode" }

    use {
      "ekickx/clipboard-image.nvim",
      disable = true,
    }

    use {
      "turbio/bracey.vim",
      run = "npm install --prefix server",
      config = function()
        require "config.tools.bracey"
      end,
      cmd = { "Bracey" },
    }

    use {
      "dstein64/vim-startuptime",
      cmd = { "StartupTime" },
    }

    use {
      "Shatur/neovim-session-manager",
      config = function()
        require "config.tools.neovim-session-manager"
      end,
      requires = {
        { "nvim-lua/plenary.nvim" },
      },
    }

    use {
      "ethanholz/nvim-lastplace",
      config = function()
        require "config.tools.nvim-lastplace"
      end,
    }

    use {
      "tpope/vim-dadbod",
    }

    use {
      "kristijanhusak/vim-dadbod-ui",
    }

    use {
      "TimUntersberger/neogit",
      config = function()
        require "config.tools.neogit"
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
        require "config.tools.octo"
      end,
    }

    use {
      "roxma/vim-tmux-clipboard",
    }

    use {
      "michaelb/sniprun",
      config = function()
        require "config.tools.sniprun"
      end,
      run = "bash install.sh",
    }

    use { "psliwka/vim-smoothie" }

    use {
      "phaazon/hop.nvim",
      config = function()
        require "config.tools.hop"
      end,
    }

    use { "tpope/vim-unimpaired" }

    use { "tpope/vim-repeat" }

    use { "tpope/vim-surround" }

    -- Language plugins
    use {
      "ray-x/lsp_signature.nvim",
      config = function()
        require "config.language.lsp_signature"
      end,
    }

    use {
      "weilbith/nvim-code-action-menu",
      cmd = { "CodeActionMenu" },
      disable = true,
    }

    use {
      "onsails/lspkind-nvim",
      config = function()
        require "config.language.lspkind"
      end,
    }

    use {
      "lewis6991/spellsitter.nvim",
      config = function()
        require "config.language.spellsitter"
      end,
      disable = true,
    }

    use {
      "brymer-meneses/grammar-guard.nvim",
      disable = true,
    }

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
      "hrsh7th/nvim-cmp",
      config = function()
        require "config.language.nvim-cmp"
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
        { "lukas-reineke/cmp-under-comparator" },
      },
    }

    use {
      "L3MON4D3/LuaSnip",
      config = function()
        require "config.language.luasnip"
      end,
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require "config.language.nvim-treesitter"
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "windwp/nvim-ts-autotag" },
        { "RRethy/nvim-treesitter-endwise" },
        { "RRethy/nvim-treesitter-textsubjects", disable = true },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
      },
    }

    use {
      "rafcamlet/nvim-luapad",
      disable = true,
    }

    use { "rafamadriz/friendly-snippets" }

    use { "williamboman/nvim-lsp-installer" }

    use { "neovim/nvim-lspconfig" }

    use {
      "github/copilot.vim",
      config = function()
        require "config.language.copilot"
      end,
    }

    use {
      "mfussenegger/nvim-dap",
      config = function()
        require "config.language.nvim-dap"
      end,
    }

    use {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require "config.language.nvim-dap-virtual-text"
      end,
    }

    use {
      "rcarriga/nvim-dap-ui",
      config = function()
        require "config.language.nvim-dap-ui"
      end,
    }

    use {
      "Pocco81/DAPInstall.nvim",
      config = function()
        require "config.language.dap-install"
      end,
    }

    use {
      "mfussenegger/nvim-dap-python",
      config = function()
        require "config.language.nvim-dap-python"
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
      "Shatur/neovim-cmake",
      config = function()
        require "config.language.neovim-cmake"
      end,
    }

    use {
      "nanotee/sqls.nvim",
      disable = true,
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
      "p00f/clangd_extensions.nvim",
    }

    use {
      "simrat39/rust-tools.nvim",
    }
  end,
  config = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
  },
}
