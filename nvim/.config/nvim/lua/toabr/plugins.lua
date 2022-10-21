local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


return require('packer').startup(function(use)
  -- packer manages itself
  use 'wbthomason/packer.nvim'

  -- All the Things
  use 'nvim-tree/nvim-tree.lua'
  use 'ahmedkhalf/project.nvim'
  use 'folke/which-key.nvim'
  use 'numToStr/Comment.nvim'
  use 'mhartington/formatter.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'akinsho/toggleterm.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'windwp/nvim-autopairs'
  -- distraction free writing
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'

  -- Styling
  use 'sainnhe/everforest'
  use 'folke/tokyonight.nvim'
  use 'gruvbox-community/gruvbox'
  use {'dracula/vim', as = 'dracula'}
  use { 'catppuccin/vim', as = 'catppuccin' }
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- LSP client
  use 'neovim/nvim-lspconfig'

  -- Completion
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer' -- buffer
  use 'hrsh7th/cmp-path'  -- path
  use 'hrsh7th/cmp-cmdline' -- cmd
  use 'saadparwaiz1/cmp_luasnip' -- snippets

  -- Snippets
  use 'L3MON4D3/LuaSnip' -- Snippet Engine
  use 'rafamadriz/friendly-snippets' -- snippets source

  -- Telescope & Friends
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim' -- neovim core stuff in telescope picker
  -- use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run =':TSUpdate' }
  use 'p00f/nvim-ts-rainbow'

  -- DAP (Debug Adapter Protocol)
  --use 'mfussenegger/nvim-dap'
  --use 'rcarriga/nvim-dap-ui'
  --use 'theHamsta/nvim-dap-virtual-text'
  --use 'nvim-telescope/telescope-dap.nvim'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
