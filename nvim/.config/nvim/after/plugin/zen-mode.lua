--------------------------------------------------------------------------------
-- folke/zen-mode.nvim
--------------------------------------------------------------------------------

local status_ok, zenmode = pcall(require, "zen-mode")
if not status_ok then
  return
end

zenmode.setup {
    window = {
        backdrop = 1,
        width = 120,
        options = {
            signcolumn = "no", -- disable signcolumn
            number = false, -- disable number column
            relativenumber = false, -- disable relative numbers
            cursorline = false, -- disable cursorline
            cursorcolumn = false, -- disable cursor column
            foldcolumn = "0", -- disable fold column
            list = false, -- disable whitespace characters
        },
    },
    plugins = {
        indent_blankline = { enabled = false },
    },
}

