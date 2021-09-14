local vim = vim
local packer = require'packer'

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return packer.startup(function (use)

  use { 'wbthomason/packer.nvim' }

-- Interface Plugins
  use {
    'akinsho/nvim-bufferline.lua',
    config = function () require'config.interface.nvim-bufferline' end,
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  use {
    'hoob3rt/lualine.nvim',
    config = function () require'config.interface.lualine' end,
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function () require'config.interface.nvim-tree' end,
    requires = { 'kyazdani42/nvim-web-devicons' },
    cmd = { 'NvimTreeToggle' }
  }

  use {
    'simrat39/symbols-outline.nvim',
    config = function () require'config.interface.symbols-outline' end,
    requires = { 'kyazdani42/nvim-web-devicons' },
    cmd = { 'SymbolsOutline' }
  }

  use {
    'glepnir/dashboard-nvim',
    config = function () require'config.interface.dashboard-nvim' end,
  }

  use {
    'folke/which-key.nvim',
    config = function () require'config.interface.which-key' end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function () require'config.interface.gitsigns' end,
    requires = 'nvim-lua/plenary.nvim',
  }

   use {
    'RRethy/vim-hexokinase',
    run = 'make hexokinase'
  }

  use {
    'romgrk/nvim-treesitter-context',
    config = function () require'config.interface.nvim-treesitter-context' end,
  }

  use {
    'folke/trouble.nvim',
    config = function () require'config.interface.trouble' end,
    requires = 'kyazdani42/nvim-web-devicons',
    cmd = { 'TroubleToggle' }
  }

  use {
    'folke/todo-comments.nvim',
    config = function () require'config.interface.todo-comments' end,
  }

  use {
    'folke/zen-mode.nvim',
    config = function () require'config.interface.zen-mode' end,
    cmd = { 'ZenMode' }
  }

  use {
    "folke/twilight.nvim",
    config = function() require'config.interface.twilight' end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function () require'config.interface.indent-blankline' end,
  }

  use {
    'rcarriga/nvim-notify',
    config = function () require'config.interface.nvim-notify' end
  }

  use { 'folke/tokyonight.nvim' }
  use { 'dracula/vim' , as = 'dracula', disable = true }
  use { 'arcticicestudio/nord-vim', disable = true }

-- Tools plugins
  use {
    'windwp/nvim-autopairs',
    config = function () require'config.tools.nvim-autopairs' end,
  }

  use {
    'windwp/nvim-ts-autotag',
    config = function () require'config.tools.nvim-ts-autotag' end,
    event = 'InsertEnter'
  }

  use {
    'RRethy/vim-illuminate',
  }

  use {
    'terrortylor/nvim-comment',
    config = function () require'config.tools.nvim-comment' end,
  }

  use {
    'mfussenegger/nvim-ts-hint-textobject',
    config = function () require'config.tools.nvim-ts-hint-textobject' end
  }

  use {
    'nvim-telescope/telescope.nvim',
    config = function () require'config.tools.telescope' end,
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-project.nvim' },
      { 'nvim-telescope/telescope-dap.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-frecency.nvim' , requires = 'tami5/sql.nvim' },
      { 'nvim-telescope/telescope-media-files.nvim' }
    }
  }

  use {
    'ahmedkhalf/project.nvim',
    config = function () require'config.tools.project' end,
  }

  use {
    'iamcco/markdown-preview.nvim',
    config = function () require'config.tools.markdown-preview' end,
    run = 'cd app && yarn install',
    ft = { 'markdown' }
  }

  use {
    'lervag/vimtex',
    config = function () require'config.tools.vimtex' end,
    ft = { 'tex' }
  }

  use {
    'sindrets/diffview.nvim',
    config = function () require'config.tools.diffview' end,
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' }
  }

  use {
    'akinsho/nvim-toggleterm.lua',
    config = function () require'config.tools.nvim-toggleterm' end,
  }

  use {
    'plasticboy/vim-markdown',
    ft = { 'markdown' }
  }

  use {
    'turbio/bracey.vim',
    run = 'npm install --prefix server',
    config = function () require'config.tools.bracey' end,
    cmd = { 'Bracey' }
  }

  use {
    'tweekmonster/startuptime.vim',
    cmd = { 'StartupTime' }
  }

  use {
    'ethanholz/nvim-lastplace',
    config = function () require'config.tools.nvim-lastplace' end,
  }

  use {
    'tpope/vim-repeat',
  }

  use {
    'tpope/vim-surround',
  }

-- Language plugins
  use {
    'sbdchd/neoformat',
    cmd = { 'Neoformat' }
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function () require'config.language.lsp_signature' end,
  }

  use {
    'onsails/lspkind-nvim',
    config = function () require 'config.language.lspkind' end,
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
      { 'kdheepak/cmp-latex-symbols' },
      { 'saadparwaiz1/cmp_luasnip' }
    }
  }

  use {
    'L3MON4D3/LuaSnip',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function () require'config.language.nvim-treesitter' end
  }
  use { 'nvim-treesitter/nvim-treesitter-refactor' }

  use {
    'simrat39/rust-tools.nvim',
    config = function () require'config.language.rust-tools' end
  }

  use {
    'mfussenegger/nvim-jdtls'
  }

  use { 'neovim/nvim-lspconfig' }

end)
