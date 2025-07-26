--------------------------------------------------------------------------------
-- akinsho/toggleterm.nvim
--------------------------------------------------------------------------------

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
    },
})

-- settings
vim.g.floaterm_width = 0.95
vim.g.floaterm_height = 0.95

-- key maps
function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- enter terminal mode
vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', { desc = "[h]orizontal" })
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm size=65 direction=vertical<cr>', { desc = "[v]ertical" })
vim.keymap.set('n', '<leader>tt', "<cmd>ToggleTerm<cr>", { desc = "[t]erminal" })

local Terminal = require("toggleterm.terminal").Terminal

-- lazygit
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

vim.keymap.set('n', '<leader>gg', function() _LAZYGIT_TOGGLE() end, { desc = "lazy[g]it" })

-- node
local node = Terminal:new({ cmd = "node", hidden = true })
function _NODE_TOGGLE()
    node:toggle()
end

-- ncdu
local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
function _NCDU_TOGGLE()
    ncdu:toggle()
end

-- htop
local htop = Terminal:new({ cmd = "htop", hidden = true })
function _HTOP_TOGGLE()
    htop:toggle()
end

-- python
local python = Terminal:new({ cmd = "python", hidden = true })
function _PYTHON_TOGGLE()
    python:toggle()
end
