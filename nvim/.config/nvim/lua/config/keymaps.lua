----------------------------------------------------------------
-- Key Mappings
----------------------------------------------------------------

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- map space as leader key
map("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keep paste buffer after paste
map("x", "p", [["_dP]], opts)

-- clear search highlight with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- map word under cursor
map("n", "gw", "*N", { desc = "search [w]ord under cursor" })
map("x", "gw", "*N", { desc = "search [w]ord under cursor" })

-- stay in visual mode after indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- windows navigating 
map("n", "<A-Left>", "<C-w>h", { desc = "Go to left window" })
map("n", "<A-Down>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<A-Up>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<A-Right>", "<C-w>l", { desc = "Go to right window" })

-- jump and center
map("n", "<S-Up>", "{zz", { desc = "jump textblock up" })
map("n", "<S-Down>", "}zz", { desc = "jump text block down" })

map("n", "<C-k>", "<C-u>zz", { desc = "scroll page up" })
map("n", "<C-j>", "<C-d>zz", { desc = "scroll page down" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move current line / block with Alt-j/k ala vscode.
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

------------------------------------------------------------------------
-- LEADER KEY MAPPINGS
------------------------------------------------------------------------

-- one key stroke
-- map("n", "<leader>n", "<cmd>enew <bar> startinsert<cr>", { desc = "new" })
-- map("n", "<leader>w", "<cmd>write<cr><esc>", { desc = "write" })
-- map("n", "<leader>q", "<cmd>quit<cr>", { desc = "quit" })
map("n", "<leader>.", "<cmd>Explore<cr>", { desc = "browse" })

-- buffer navigation
map("n", "<leader>bb", "<cmd>b#<cr>", { desc = "other [b]uffer" })
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "[n]ext" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "[p]revious" })
-- use 'echasnovski/mini.bufremove' instead
-- map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "buffer [d]elete" })

-- user interface
--map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "[d]ignostics"})
map("n", "<leader>ug", "<cmd>set scl=no<cr>", { desc = "[g]utter" })
map("n", "<leader>ul", "<cmd>set list!<cr>", { desc = "[l]ist" })
map("n", "<leader>un", "<cmd>set number!<cr>", { desc = "[n]umbers" })
map("n", "<leader>ur", "<cmd>set relativenumber!<cr>", { desc = "[r]elative numbers" })
map("n", "<leader>uR", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", { desc = "[R]edraw" })
map("n", "<leader>us", "<cmd>set spell!<cr>", { desc = "[s]pelling" })
map("n", "<leader>uw", "<cmd>set wrap!<cr>", { desc = "[w]rap" })

-- fix lists
map("n", "<leader>xm", "<cmd>messages<cr>", { desc = "[m]essages list" })

-- specials
map({"n", "v"}, "<leader><leader>y", [["+y]], { desc = "[y]ank to system" })
map("n", "<leader><leader>Y", [["+Y]], { desc = "[Y]ank line to system" })
map("n", "<leader><leader>x", "<cmd>w<cr><cmd>so%<cr>", { desc = "Save & Source" })

