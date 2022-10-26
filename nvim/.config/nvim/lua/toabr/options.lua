-- reloads neovim on save
vim.cmd([[
  augroup vimrc_reload
    autocmd!
    autocmd BufWritePost options.lua source % | echom "Reloaded options.lua" | redraw
  augroup end
]])

-- files
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.undofile = true -- enable persistent undo
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"

-- style
vim.g.mapleader = " "
vim.opt.mouse = "a"
vim.opt.showmode = false -- no -- INSERT anymore
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.laststatus = 3 -- one liner in splits
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.timeoutlen = 500 -- wait for a mapped sequence
vim.opt.diffopt = 'vertical'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
-- n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkon100"

-- indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.smartindent = true
-- whitespace characters
vim.opt.list = true
vim.opt.listchars = 'lead:⸱'

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.wildignore = {
    'node_modules/**',
    '.git/**',
}

