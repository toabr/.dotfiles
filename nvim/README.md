# NeoVim Config

<br/>

## Requirements
```
sudo apt install git curl tar gzip build-essential wget unzip 
```

### python
```
sudo apt install python3 python3-pip &&\
pip install pynvim
```

### nodejs - [ppa](https://github.com/nodesource/distributions)
```
curl -fssl https://deb.nodesource.com/setup_21.x | sudo -e bash - &&\
sudo apt-get install -y nodejs &&\
npm i -g neovim
```

### telescope dependencies: [`ripgrep`](https://github.com/BurntSushi/ripgrep), [`fd-find`](https://github.com/sharkdp/fd), [`fzf`](https://github.com/junegunn/fzf)
```
sudo apt install ripgrep fd-find
```

<br/>

## Install NeoVim [stable](https://github.com/neovim/neovim/releases/tag/stable)

#### download nvim executable:
```
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz &&\
sudo tar xzvf nvim-linux64.tar.gz -C /opt
```

#### create an alias:
```
alias nvim=/opt/nvim-linux64/bin/nvim
```

#### create a menu entry:
```
curl https://raw.githubusercontent.com/neovim/neovim/master/runtime/nvim.desktop -o ~/.local/share/applications/nvim.desktop
```

<br/>

## Install nvim configs
```
# clean old configs just in case
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim

mkdir -p ~/.config/nvim

stow -Svt ~ nvim
```
Start Neovim and get healthy:
```
:checkhealth
```

<br/>

### Included plugins:

###### Package manager
- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)

###### Coding
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)

###### Editor
- [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- [echasnovski/mini.bufremove](https://github.com/echasnovski/mini.bufremove)
- [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

###### Util
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [folke/persistence.nvim](https://github.com/folke/persistence.nvim)

###### UI
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim)

###### Colorschemes
- [sainnhe/everforest](https://github.com/sainnhe/everforest)
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [catppuccin/nvim](https://github.com/catppuccin/nvim)
- [arcticicestudio/nord-vim](https://github.com/arcticicestudio/nord-vim)
- [navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim)

###### Completion
- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

###### LSP support
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [jay-babu/mason-null-ls.nvim](https://github.com/jay-babu/mason-null-ls.nvim)
- [SmiteshP/nvim-navic](https://github.com/SmiteshP/nvim-navic)

###### Treesitter
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

<br/>

## Credits to

[LunarVim/Launch.nvim](https://github.com/LunarVim/Launch.nvim) & [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
