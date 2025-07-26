-----------------------------------------
-- Netrw File Browser
-----------------------------------------

-- wipeout netrw buffers when they are hidden
vim.cmd([[
    augroup AutoDeleteNetrwHiddenBuffers
      au!
      au FileType netrw setlocal bufhidden=wipe
    augroup end
]])

-- NETRW
vim.g.netrw_browse_split = 0
vim.g.netrw_keepdir = 1
-- vim.g.netrw_banner = 0
vim.g.netrw_winsize = 35
vim.g.netrw_liststyle = 3
vim.g.netrw_fastbrowse = 2
vim.g.netrw_localcopydircmd = 'cp -r'
