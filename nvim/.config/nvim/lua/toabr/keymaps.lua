local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local Util = require("toabr.util")

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

map("n", '<C-z>', 'u', { desc = "undo on ctrl-z"})
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

--[[ TODO: next and prev ]]
-- Buffer navigation
map("n", "<leader>bb", "<cmd>e#<cr>", { desc = "other [b]uffer" })
map("n", "<S-RIGHT>", "<cmd>bnext<cr>", opts)
map("n", "<S-LEFT>", "<cmd>bprevious<cr>", opts)

-- Better paste
map("v", "p", '"_dP', opts)
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

--[[ FIXME: you will figure it out ]]
map("n", "<leader><leader>x", "<cmd>w<cr><cmd>so%<cr>", { desc = "Save & Source" })
map("n", "<leader>fe", "<cmd>Lexplore<cr>", { desc = "[e]xplorer" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "[n]ew" })
map("n", "<leader>xm", "<cmd>messages<cr>", { desc = "[m]essages list" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "[q]uit all" })
map("n", "<leader>qQ", "<cmd>qa!<cr>", { desc = "[Q]uit all!" })
map("n", "<leader>ww", "<C-W>p", { desc = "s[w]itch" })
map("n", "<leader>wq", "<C-W>c", { desc = "[q]uit" })
map("n", "<leader>ws", "<C-W>s", { desc = "[s]plit" })
map("n", "<leader>wv", "<C-W>v", { desc = "[v]ertical split" })
map({"n", "v"}, "<leader>yy", [["+y]], { desc = "[y]ank to system" })
map("n", "<leader>yY", [["+Y]], { desc = "[Y]ank line to system" })
map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "[d]ignostics"})
map("n", "<leader>uR", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "[R]edraw" })
map("n", "<leader>un", "<cmd>set number!<cr>", { desc = "[n]umbers" })
map("n", "<leader>ur", "<cmd>set relativenumber!<cr>", { desc = "[r]elative numbers" })
map("n", "<leader>uw", "<cmd>set wrap!<cr>", { desc = "[w]rap" })
map("n", "<leader>ul", "<cmd>set list!<cr>", { desc = "[l]ist" })
map("n", "<leader>uz", "<cmd>ZenMode<cr>", { desc = "[z]en" })

