require('toabr.options')
require('toabr.plugins')
require('toabr.remap')

-- netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
--vim.g.netrw_winsize = 25

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],	false)

