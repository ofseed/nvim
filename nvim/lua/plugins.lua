require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'

--[[
-- Interface Plugins
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require'config.interface.galaxyline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

]]--
  use {
    'akinsho/nvim-bufferline.lua',
    config = function() require'config.interface.nvim-bufferline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'config.interface.nvim-tree' end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'simrat39/symbols-outline.nvim',
    config = function () require'config.interface.symbols-outline' end,
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'glepnir/dashboard-nvim',
    config = function () require'config.interface.dashboard-nvim' end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function () require'config.interface.gitsigns' end,
    requires = 'nvim-lua/plenary.nvim'
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function () require'colorizer'.setup() end
  }

  use {
    'romgrk/nvim-treesitter-context',
    config = function ()
        require'config.interface.nvim-treesitter-context'
    end
  }

  use {
    'folke/trouble.nvim',
    config = function () require'config.interface.trouble' end,
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use {
    'rcarriga/nvim-notify',
    config = function () require'config.interface.nvim-notify' end
  }

  use {'dracula/vim', as = 'dracula'}
  use {'theHamsta/nvim-dap-virtual-text'}
  use {'kyazdani42/nvim-web-devicons'}

-- Language plugins
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',}
  use {'neovim/nvim-lspconfig',}
  use {'kabouzeid/nvim-lspinstall'}
  use {'nvim-treesitter/nvim-treesitter-refactor'}
  use {'hrsh7th/nvim-cmp', requires = 'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'saadparwaiz1/cmp_luasnip'}
  use {'L3MON4D3/LuaSnip'}
  use {'sbdchd/neoformat'}
  use {'ray-x/lsp_signature.nvim'}

-- Tools plugins
  use {
    'windwp/nvim-autopairs',
    config = function ()
        require'nvim-autopairs'.setup()
    end
  }

  use {
    'windwp/nvim-ts-autotag',
    config = function () require'config.tools.nvim-ts-autotag' end
  }

  use {
    'folke/zen-mode.nvim',
    config = function () require'config.tools.zen-mode' end
  }

  use {
    'terrortylor/nvim-comment',
    config = function () require'config.tools.nvim-comment' end
  }

  use {
    'ethanholz/nvim-lastplace',
    config = function () require'config.tools.nvim-lastplace' end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    }
  }
  use {'nvim-telescope/telescope-project.nvim'}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'iamcco/markdown-preview.nvim',
    config = function () require'config.tools.markdown-preview' end,
    run = 'cd app && yarn install'
  }

  use {
    'lervag/vimtex',
    config = function () require'config.tools.vimtex' end
  }

  use {
    'sindrets/diffview.nvim',
    config = function () require'config.tools.diffview' end
  }

  use {
    'akinsho/nvim-toggleterm.lua',
    config = function () require'config.tools.nvim-toggleterm' end
  }

  use {
    'kdheepak/lazygit.nvim',
    config = function () require'config.tools.lazygit' end
  }

  use {'tpope/vim-surround'}
  use {'turbio/bracey.vim', run = 'npm install --prefix server'}
  use {'mfussenegger/nvim-dap'}
  use {'Pocco81/DAPInstall.nvim'}

end)
