--------------------------------------------------------------------------------
-- folke/which-key.nvim
--------------------------------------------------------------------------------

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local get_icon = require("toabr.util").get_icon

local setup = {
    key_labels = {
        ["<space>"] = "_",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»",                  -- symbol used in the command line area that shows your active key combo
        separator = get_icon("SlimArrow"), -- symbol used between a key and it's label
        group = get_icon(),                -- symbol prepended to a group
    },
    window = {
        border = "single",        -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 3, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3,                    -- spacing between columns
        align = "center",               -- align columns left, center or right
    },
}

local mappings = {
    ["g"] = { name = "goto" },
    ["]"] = { name = "next" },
    ["["] = { name = "prev" },
    ["<leader><space>"] = { name = get_icon("Star", 1) .. "Leader" },
    ["<leader>b"] = { name = get_icon("Buffer", 1) .. "buffer" },
    ["<leader>f"] = { name = get_icon("Find", 1) .. "find" },
    ["<leader>g"] = { name = get_icon("Git", 1) .. "git" },
    ["<leader>gh"] = { name = "hunk" },
    ["<leader>l"] = { name = get_icon("LSP", 1) .. "lsp" },
    ["<leader>s"] = { name = get_icon("Session", 1) .. "session" },
    ["<leader>t"] = { name = get_icon("Terminal", 1) .. "terminal" },
    ["<leader>u"] = { name = get_icon("Window", 1) .. "ui/toggle" },
    ["<leader>w"] = { name = get_icon("Window", 1) .. "window" },
    ["<leader>x"] = { name = get_icon("List", 1) .. "fix" },
}

which_key.setup(setup)
which_key.register(mappings)

vim.api.nvim_set_hl(0, "WhichKeyFloat", { ctermbg = 'black', ctermfg = 'black' })
vim.api.nvim_set_hl(0, "WhichKeyBorder", { ctermbg = 'black', ctermfg = 'black' })
