--------------------------------------------------------------------------------
-- folke/which-key.nvim
--------------------------------------------------------------------------------

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
    window = {
        border = "single", -- none, single, double, shadow
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 8,
        align = "center", -- align columns left, center or right
    },
}

local mappings = {
    ["g"] = { name = "[g]oto" },
    ["]"] = { name = "next" },
    ["["] = { name = "prev" },
    ["<leader>b"] = { name = "[b]uffer"},
    ["<leader>f"] = { name = "[f]ind" },
    ["<leader>g"] = { name = "[g]it" },
    ["<leader>gh"] = { name = "[h]unk" },
    ["<leader>l"] = { name = "[l]sp" },
    ["<leader>q"] = { name = "[q]uit" },
    ["<leader>s"] = { name = "[s]earch" },
    ["<leader>t"] = { name = "[t]erminal" },
    ["<leader>u"] = { name = "[u]i/toggle" },
    ["<leader>w"] = { name = "[w]indow" },
    ["<leader>x"] = { name = "fi[x]" },
    ["<leader>y"] = { name = "[y]ank" },
}

which_key.setup(setup)
which_key.register(mappings)

vim.api.nvim_set_hl(0, "WhichKeyFloat", { ctermbg = 'black', ctermfg = 'black' })
vim.api.nvim_set_hl(0, "WhichKeyBorder", { ctermbg = 'black', ctermfg = 'black' })

