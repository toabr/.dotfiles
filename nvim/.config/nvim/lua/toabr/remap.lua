-- https://neovim.io/doc/user/api.html#nvim_set_keymap()
--vim.api.nvim_set_keymap('n', 'pv', '<cmd>Ex<CR>', {noremap = true})

-- crtl + z closes vim to the background in tmux
vim.keymap.set('n', '<C-z>', 'u')

-- enter terminal mode
-- vim.keymap.set('n', '<leader>t', '<cmd>FloatermNew<cr>')

-- LAZYGIT in a Floatterm
vim.g.floaterm_width = 0.95
vim.g.floaterm_height = 0.95
-- vim.keymap.set('n', '<leader>g', ':FloatermNew lazygit<CR>')

