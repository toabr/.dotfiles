local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local Util = require("toabr.util")
local builtin = require('telescope.builtin')

-- reloads neovim on save
vim.cmd([[
  augroup keymap_reload
    autocmd!
    autocmd BufWritePost keymap.lua source % | echom "Reloaded keymap.lua" | redraw
  augroup end
]])

-- Shorten function name
local map = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
-- map space as leader key
-- map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- make ö & ä unseful
vim.o.langmap = "ö[,ä],Ö{,Ä}"

-- undo on ctrl-z
map('n', '<C-z>', 'u')

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Telescope
map('n', '<C-p>', "<cmd>Telescope builtin<cr>", opts)

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Navigate buffers
map("n", "<S-RIGHT>", "<cmd>bnext<cr>", opts)
map("n", "<S-LEFT>", "<cmd>bprevious<cr>", opts)

-- Better paste
map("v", "p", '"_dP', opts)

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- serch word under cursor
map("n", "gw", "*N")
map("x", "gw", "*N")

-- stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- jump textblock with arrow keys
map("n", "<C-Up>", "{", { desc = "jump textblock up" })
map("n", "<C-Down>", "}", { desc = "jump text block down" })

-- Resize wibdow using <ctrl> arrow keys
-- map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-DOWN>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-UP>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-DOWN>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-UP>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-DOWN>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-UP>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Quickly add empty lines
map("n", "ö<cr>", ":<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[", { desc = "add empty line above" })
map("n", "ä<cr>", ":<c-u>put =repeat(nr2char(10), v:count1)<cr>", { desc = "add empty line below" })

-- LEADER --------------------------------------------------------------

-- open Netrw (see options)
map("n", "<leader>fe", "<cmd>Lexplore<cr>", { desc = "[e]xplorer" })

-- Buffers
map("n", "<leader>bb", "<cmd>e#<cr>", { desc = "other [b]uffer" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "[n]ew" })

map("n", "<leader>xj", builtin.jumplist, { desc = "[j]ump list" })
map("n", "<leader>xl", builtin.loclist, { desc = "[l]ocation list" })
map("n", "<leader>xm", "<cmd>messages<cr>", { desc = "[m]essages list" })
map("n", "<leader>xq", builtin.quickfix, { desc = "[q]uickfix list" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "[q]uit all" })
map("n", "<leader>qQ", "<cmd>qa!<cr>", { desc = "[Q]uit all!" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "s[w]itch" })
map("n", "<leader>wq", "<C-W>c", { desc = "[q]uit" })
map("n", "<leader>ws", "<C-W>s", { desc = "[s]plit" })
map("n", "<leader>wv", "<C-W>v", { desc = "[v]ertical split" })

-- share system clipboard by seperate keymap
map({"n", "v"}, "<leader>yy", [["+y]], { desc = "[y]ank to system" })
map("n", "<leader>yY", [["+Y]], { desc = "[Y]ank line to system" })

-- enter terminal mode
map('n', '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', { desc = "[h]orizontal" })
map('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', { desc = "[v]ertical" })
map('n', '<leader>tf', "<cmd>ToggleTerm<cr>", { desc = "[f]loat" })

-- UI
map( "n", "<leader>ud", Util.toggle_diagnostics, { desc = "[d]ignostics"})
map( "n", "<leader>uR", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "[R]edraw" })
map("n", "<leader>un", "<cmd>set number!<cr>", { desc = "[n]umbers" })
map("n", "<leader>ur", "<cmd>set relativenumber!<cr>", { desc = "[r]elative numbers" })
map("n", "<leader>uw", "<cmd>set wrap!<cr>", { desc = "[w]rap" })
map("n", "<leader>ul", "<cmd>set list!<cr>", { desc = "[l]ist" })
map("n", "<leader>uz", "<cmd>ZenMode<cr>", { desc = "[z]en" })

-- find
map("n", "<leader>fb", builtin.buffers, { desc = "[b]uffers" })
map('n', '<leader>ff', function()
    builtin.find_files(require('telescope.themes').get_dropdown({
        hidden = true,
        previewer = false,
    }))
end, { desc = '[f]iles' })
map("n", "<leader>fr", builtin.oldfiles, { desc = "[r]ecent" })

-- git
map('n', '<leader>gc', builtin.git_commits, { desc = '[c]ommits' })
map('n', '<leader>gb', builtin.git_branches, { desc = '[b]ranches' })
map('n', '<leader>gs', builtin.git_status, { desc = '[s]tatus' })
map('n', '<leader>gg', function() _LAZYGIT_TOGGLE() end, { desc = "lazy[g]it" })

-- search
map('n', '<C-f>', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        previewer = false,
    }))
end, { desc = "[F]ind in current buffer" })
map('n', '<leader>sa', builtin.autocommands, { desc = '[a]uto commands' })
map('n', '<leader>sb', builtin.current_buffer_fuzzy_find, { desc = '[b]uffer' })
map('n', '<leader>sc', builtin.command_history, { desc = '[c]ommand history' })
map('n', '<leader>sC', builtin.commands, { desc = '[C]ommands' })
map('n', '<leader>sg', builtin.live_grep, { desc = '[g]rep' })
map('n', '<leader>sh', builtin.help_tags, { desc = '[h]elp' })
map('n', '<leader>sH', builtin.highlights, { desc = '[H]ighlights' })
map('n', '<leader>sk', builtin.keymaps, { desc = '[k]ey maps' })
map('n', '<leader>sm', builtin.marks, { desc = '[m]arks' })
map('n', '<leader>sM', builtin.man_pages, { desc = '[M]an pages' })
map('n', '<leader>so', builtin.vim_options, { desc = '[o]ptions' })
map('n', '<leader>sR', builtin.resume, { desc = '[R]esume' })
map('n', '<leader>sw', builtin.grep_string, { desc = '[w]ord' })
map('n', '<leader>uC', builtin.colorscheme, { desc = '[C]olorscheme' })

