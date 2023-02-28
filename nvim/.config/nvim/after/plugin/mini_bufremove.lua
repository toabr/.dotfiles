--------------------------------------------------------------------------------
-- echasnovski/mini.bufremove
--------------------------------------------------------------------------------

local status_ok, mini_bufremove = pcall(require, "mini.bufremove")
if not status_ok then
    return
end

mini_bufremove.setup {}

vim.keymap.set('n', '<leader>bd', function() mini_bufremove.delete(0, false) end, { desc = '[d]elete' })
vim.keymap.set('n', '<leader>bD', function() mini_bufremove.delete(0, true) end, { desc = '[D]elete!' })

