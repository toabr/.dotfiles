# NeoVim Config

**Requirements:**
- [`NeoVim`](#install-neovim-stable), `git`, `python3-pip`, pip's `pynvim`, `node`, npm's `neovim`, `g++` compiler, [`ripgrep`](https://github.com/BurntSushi/ripgrep/releases), [`fdfind`](https://github.com/sharkdp/fd/releases), [`fzf`](https://github.com/junegunn/fzf/releases)
- clean `~/.config/nvim` `~/.local/share/nvim` `~/.local/state/nvim` ~`~/.cache/nvim`~

**Install configs under:** `~/.config/nvim/`

**Start Neovim:** `nvim`

**Get healthy:** `:checkhealth`

<br/>

## Plugins:

###### Package manager
- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)

###### Coding
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)

###### Editor
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [echasnovski/mini.bufremove](https://github.com/echasnovski/mini.bufremove)
- [folke/persistence.nvim](https://github.com/folke/persistence.nvim)

###### UI
- [sainnhe/everforest](https://github.com/sainnhe/everforest)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- [folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim)

###### Auto completion
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

###### LSP client support
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)

###### Treesitter
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

<br/>

## Install NeoVim [stable](https://github.com/neovim/neovim/releases/tag/stable)

**via deb package:**

`curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb`

`sudo apt install ./nvim-linux64.deb`

**create a menu entry:**

`curl https://raw.githubusercontent.com/neovim/neovim/master/runtime/nvim.desktop -o ~/.local/share/applications/nvim.desktop`

<br/>

## Credits to

[LunarVim/nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide) & [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
