--------------------------------------------------------------------------------
-- nvim-lualine/lualine.nvim
--------------------------------------------------------------------------------

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "auto",
        component_separators = "|",
        section_separators = "",
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1, },
        },
        lualine_x = { "encoding", "fileformat", },
        lualine_y = { "location" },
        lualine_z = { "progress" },
    },
    winbar = {
        lualine_a = {"filename"},
        lualine_b = {},
        lualine_c = {"%="},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {
        lualine_a = {"filename"},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}

vim.opt.showmode = false -- no -- INSERT anymore
vim.opt.laststatus = 3 -- one liner in splits

