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
      "hoob3rt/lualine.nvim",
      config = function()
        require "config.interface.lualine"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {
      "kyazdani42/nvim-tree.lua",
      config = function()
        require "config.interface.nvim-tree"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
    }

    use {
      "simrat39/symbols-outline.nvim",
      config = function()
        require "config.interface.symbols-outline"
      end,
      requires = { "kyazdani42/nvim-web-devicons" },
      cmd = { "SymbolsOutline" },
    }

    use {
      "glepnir/dashboard-nvim",
      config = function()
        require "config.interface.dashboard-nvim"
      end,
    }

    -- use {
    --   "goolord/alpha-nvim",
    -- }

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
      "folke/trouble.nvim",
      config = function()
        require "config.interface.trouble"
      end,
      requires = "kyazdani42/nvim-web-devicons",
      cmd = { "TroubleToggle" },
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
      cmd = { "ZenMode", "Twilight" },
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

    use { "dstein64/nvim-scrollview" }

    use { "folke/tokyonight.nvim" }
    use { "navarasu/onedark.nvim" }
    use { "shaunsingh/solarized.nvim" }
    use { "shaunsingh/nord.nvim" }
    use { "Mofiqul/dracula.nvim" }

    -- Tools plugins
    use {
      "kristijanhusak/orgmode.nvim",
      config = function()
        require "config.tools.orgmode"
      end,
    }

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
      "mfussenegger/nvim-ts-hint-textobject",
      config = function()
        require "config.tools.nvim-ts-hint-textobject"
      end,
    }

    use {
      "nvim-telescope/telescope.nvim",
      config = function()
        require "config.tools.telescope"
      end,
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-project.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-frecency.nvim", requires = "tami5/sql.nvim" },
        { "nvim-telescope/telescope-media-files.nvim" },
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

    use {
      "turbio/bracey.vim",
      run = "npm install --prefix server",
      config = function()
        require "config.tools.bracey"
      end,
      cmd = { "Bracey" },
    }

    use {
      "tweekmonster/startuptime.vim",
      cmd = { "StartupTime" },
    }

    use {
      "ethanholz/nvim-lastplace",
      config = function()
        require "config.tools.nvim-lastplace"
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
      "~/Documents/GitHub/nvim-cmp",
      config = function()
        require "config.language.nvim-cmp"
      end,
      requires = {
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/cmp-calc" },
        { "hrsh7th/cmp-nvim-lua" },
        { "kdheepak/cmp-latex-symbols" },
        { "saadparwaiz1/cmp_luasnip" },
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
        { "JoosepAlviste/nvim-ts-context-commentstring" },
      },
    }

    use {
      "simrat39/rust-tools.nvim",
      config = function()
        require "config.language.rust-tools"
      end,
      ft = { "rust" },
    }

    use { "rafamadriz/friendly-snippets" }

    use { "williamboman/nvim-lsp-installer" }

    use { "neovim/nvim-lspconfig" }

    use { "github/copilot.vim" }
  end,
  config = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
  },
}
