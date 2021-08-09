vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

-- UI Plugins
  use 'kyazdani42/nvim-web-devicons'
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {'simrat39/symbols-outline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use 'glepnir/dashboard-nvim'
  use 'kdheepak/lazygit.nvim'
  use {'dracula/vim', as = 'dracula'}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
--use 'lukas-reineke/indent-blankline.nvim'
--use 'glepnir/galaxyline.nvim'

-- LSP plugins
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'sbdchd/neoformat'

-- Tools plugins
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use 'nvim-telescope/telescope-project.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
  use 'lervag/vimtex'
  use 'norcalli/nvim-colorizer.lua'
  use 'kassio/neoterm'


-- Edit plugins
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'junegunn/goyo.vim'
end)
