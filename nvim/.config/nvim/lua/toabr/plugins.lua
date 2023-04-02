----------------------------------------------------------------
-- wbthomason/packer.nvim
----------------------------------------------------------------

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

return packer.startup(function(use)
    -- packer manages itself
    use 'wbthomason/packer.nvim'

    -- Coding -------------------------------
    use 'numToStr/Comment.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'windwp/nvim-autopairs'
    use 'kylechui/nvim-surround'

    -- Editor -------------------------------
    use 'akinsho/toggleterm.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'folke/which-key.nvim'
    use 'echasnovski/mini.bufremove'
    use 'RRethy/vim-illuminate'
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }

    -- Util ---------------------------------
    use 'nvim-lua/plenary.nvim'
    use 'folke/persistence.nvim'
    -- use 'ahmedkhalf/project.nvim'

    -- UI -----------------------------------
    use 'nvim-lualine/lualine.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'folke/zen-mode.nvim'
    -- use 'goolord/alpha-nvim'

    -- Colorschemes -------------------------
    use 'arcticicestudio/nord-vim'
    use 'navarasu/onedark.nvim'
    use 'folke/tokyonight.nvim'
    use 'catppuccin/nvim'
    -- use 'sainnhe/everforest'
    use '/home/c3to/Desktop/everforest'

    -- cmp ----------------------------------
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source
    use 'hrsh7th/cmp-buffer' -- Buffer source
    use 'hrsh7th/cmp-path' -- Path source
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source

    use 'L3MON4D3/LuaSnip' -- Snippets engine
    use "rafamadriz/friendly-snippets" -- Snippets

    -- LSP client support -------------------
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- treesitter
    use 'nvim-treesitter/nvim-treesitter'

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
