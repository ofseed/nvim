vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

-- Interface Plugins
  use 'kyazdani42/nvim-web-devicons'
  use {
    'glepnir/galaxyline.nvim',
      branch = 'main',
      config = function() require'config/statusline' end,
      requires = {'kyazdani42/nvim-web-devicons'}
  }
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
  use { 'wfxr/minimap.vim', run = ':!cargo install --locked code-minimap'}
  use 'theHamsta/nvim-dap-virtual-text'
  --use 'lukas-reineke/indent-blankline.nvim'

-- Language plugins
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'ray-x/lsp_signature.nvim'
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use 'sbdchd/neoformat'
  --use 'simrat39/rust-tools.nvim'

-- Tools plugins
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'folke/zen-mode.nvim'
  use 'terrortylor/nvim-comment' 
  use {'turbio/bracey.vim', run = 'npm install --prefix server'}
  use 'ethanholz/nvim-lastplace'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'nvim-telescope/telescope-project.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
  use 'lervag/vimtex'
  use 'norcalli/nvim-colorizer.lua'
  use 'sindrets/diffview.nvim'
  use 'akinsho/nvim-toggleterm.lua'
  use 'mfussenegger/nvim-dap'
  use 'Pocco81/DAPInstall.nvim'
  use 'romgrk/nvim-treesitter-context'
  use 'tpope/vim-surround'
end)
