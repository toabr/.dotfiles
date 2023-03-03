-- reloads neovim on save
vim.cmd([[
  augroup vimrc_reload
    autocmd!
    autocmd BufWritePost options.lua source % | echom "Reloaded options.lua" | redraw
  augroup end
]])

local opt = vim.opt
-- files
opt.swapfile = false
opt.undofile = true -- enable persistent undo
opt.undodir = vim.fn.stdpath "cache" .. "/undo"
-- better dont confuse clipboards ...
-- vim.opt.clipboard = "unnamedplus" -- allows system clipboard
opt.updatetime = 350

-- style
opt.mouse = "a"
opt.completeopt = { "menu","menuone","noselect" }
opt.number = true
opt.relativenumber = false
opt.signcolumn = "yes"
opt.cursorline = true
opt.pumheight = 10 -- pop up menu height
opt.timeoutlen = 500 -- wait for a mapped sequence
opt.diffopt = 'vertical'
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.guicursor = {
    "n-v-c-sm:block",
    "i-ci-ve:ver25",
    "r-cr-o:hor20",
    "a:blinkon100",
}

-- indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
-- whitespace characters
opt.list = true
opt.listchars = {
    tab = '→ ',
    lead = '⸱',
    trail = '⸱',
    -- space = '.',
    -- eol = '↵',
    precedes = '←',
    extends = '→',
    nbsp = '␣',
}

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.wildmode = "longest:full,full"
opt.wildignore = {
    'node_modules/**',
    '.git/**',
}

