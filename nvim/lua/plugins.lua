local vim = vim
local packer = require'packer'

packer.startup(function (use)

  -- TODO:
  -- Optimize startup speed for plugins with dependencies
  -- More telescope extensions and configurations
  -- Configurations about project.nvim hop.nvim

  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

-- Interface Plugins
  use {
    'akinsho/nvim-bufferline.lua',
    config = function () require'config.interface.nvim-bufferline' end,
    requires = { 'kyazdani42/nvim-web-devicons' },
    opt = true,
    event = 'VimEnter'
  }

  use {
    'hoob3rt/lualine.nvim',
    config = function () require'config.interface.lualine' end,
    requires = { 'kyazdani42/nvim-web-devicons' },
    opt = true,
    event = 'VimEnter'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function () require'config.interface.nvim-tree' end,
    requires = { 'kyazdani42/nvim-web-devicons' },
    opt = true,
    cmd = { 'NvimTreeToggle' }
  }

  use {
    'simrat39/symbols-outline.nvim',
    config = function () require'config.interface.symbols-outline' end,
    requires = { 'kyazdani42/nvim-web-devicons' },
    opt = true,
    cmd = { 'SymbolsOutline' }
  }

  use {
    'glepnir/dashboard-nvim',
    config = function () require'config.interface.dashboard-nvim' end,
  }

  use {
    'folke/which-key.nvim',
    config = function () require'config.interface.which-key' end,
    opt = true,
    event = 'VimEnter'
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function () require'config.interface.gitsigns' end,
    requires = 'nvim-lua/plenary.nvim',
    opt = true,
    event = 'VimEnter'
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function () require'colorizer'.setup() end,
    opt = true,
    event = 'VimEnter'
  }

  use {
    'romgrk/nvim-treesitter-context',
    config = function () require'config.interface.nvim-treesitter-context' end,
    opt = true,
    event = 'VimEnter'
  }

  use {
    'folke/trouble.nvim',
    config = function () require'config.interface.trouble' end,
    requires = 'kyazdani42/nvim-web-devicons',
    opt = true,
    cmd = { 'TroubleToggle' }
  }

  use {
    'folke/todo-comments.nvim',
    config = function () require'config.interface.todo-comments' end,
    opt = true,
    event = 'VimEnter'
  }

  use {
    'folke/zen-mode.nvim',
    config = function () require'config.interface.zen-mode' end,
    opt = true,
    cmd = { 'ZenMode' }
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function () require'config.interface.indent-blankline' end,
  }

  use {
    'rcarriga/nvim-notify',
    config = function () require'config.interface.nvim-notify' end
  }

  use { 'dracula/vim' , as = 'dracula' }
  use { 'folke/tokyonight.nvim' }
  use { 'arcticicestudio/nord-vim' }

-- Tools plugins
  use {
    'windwp/nvim-autopairs',
    config = function () require'config.tools.nvim-autopairs' end,
    opt = true,
    event = 'InsertEnter'
  }

  use {
    'windwp/nvim-ts-autotag',
    config = function () require'config.tools.nvim-ts-autotag' end,
    opt = true,
    event = 'InsertEnter'
  }

  use {
    'RRethy/vim-illuminate',
    opt = true,
    event = 'VimEnter'
  }

  use {
    'terrortylor/nvim-comment',
    config = function () require'config.tools.nvim-comment' end,
    opt = true,
    event = 'VimEnter'
  }

  use {
    'phaazon/hop.nvim',
    config = function () require'config.tools.hop' end,
    as = 'hop',
    opt = true,
    event = 'VimEnter'
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function () require'config.tools.telescope' end,
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-project.nvim' },
      { 'nvim-telescope/telescope-hop.nvim' },
      { 'nvim-telescope/telescope-dap.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-frecency.nvim' , require = 'tami5/sql.nvim'},
      { 'nvim-telescope/telescope-media-files.nvim' }
    }
  }

  use {
    'ahmedkhalf/project.nvim',
    config = function () require'config.tools.project' end,
    opt = true,
    event = 'VimEnter'
  }

  use {
    'iamcco/markdown-preview.nvim',
    config = function () require'config.tools.markdown-preview' end,
    run = 'cd app && yarn install',
    opt = true,
    ft = { 'markdown' }
  }

  use {
    'lervag/vimtex',
    config = function () require'config.tools.vimtex' end,
    opt = true,
    ft = { 'tex' }
  }

  use {
    'sindrets/diffview.nvim',
    config = function () require'config.tools.diffview' end,
    opt = true,
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' }
  }

  use {
    'akinsho/nvim-toggleterm.lua',
    config = function () require'config.tools.nvim-toggleterm' end,
    opt = true,
    event = 'VimEnter'
  }

  use {
    'plasticboy/vim-markdown',
    opt = true,
    ft = { 'markdown' }
  }

  use { 'turbio/bracey.vim',
    run = 'npm install --prefix server',
    opt = true,
    cmd = { 'Bracey' }
  }

  use {
    'tweekmonster/startuptime.vim',
    opt = true,
    cmd = { 'StartupTime' }
  }

  use {
    'tpope/vim-repeat',
    opt = true,
    event = 'VimEnter'
  }

  use {
    'tpope/vim-surround',
    opt = true,
    event = 'VimEnter'
  }

  use {
    'ethanholz/nvim-lastplace',
    config = function () require'config.tools.nvim-lastplace' end,
  }

-- Language plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function () require'config.language.nvim-treesitter' end,
    requires = {
      { 'nvim-treesitter/nvim-treesitter-refactor' }
    }
  }

  use {
    'sbdchd/neoformat',
    opt = true,
    cmd = { 'Neoformat' }
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function () require'config.language.lsp_signature' end,
    opt = true,
    event = 'InsertEnter'
  }

  use {
    'mfussenegger/nvim-dap',
    config = function () require'config.language.nvim-dap' end,
    requires = {
      { "rcarriga/nvim-dap-ui" },
      { 'Pocco81/DAPInstall.nvim' },
      { 'theHamsta/nvim-dap-virtual-text' }
    }
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function () require'config.language.nvim-cmp' end,
    requires = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-calc' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'kdheepak/cmp-latex-symbols' }
    }
  }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'L3MON4D3/LuaSnip' }

  use { 'neovim/nvim-lspconfig' }
  use { 'kabouzeid/nvim-lspinstall' }

end)

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
