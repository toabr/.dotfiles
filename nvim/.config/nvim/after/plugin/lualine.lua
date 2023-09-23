--------------------------------------------------------------------------------
-- nvim-lualine/lualine.nvim
--------------------------------------------------------------------------------

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local components = {
    lsp = {
        function()
            local buf_clients = vim.lsp.buf_get_clients()
            if next(buf_clients) == nil then
                return "[inactive...]"
            end

            local buf_client_names = {}
            for _, client in pairs(buf_clients) do
                table.insert(buf_client_names, client.name)
            end

            local unique_client_names = vim.fn.uniq(buf_client_names)
            local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"

            return language_servers
        end,
    },
    spaces = {
        function()
            local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
            return "↦ " .. shiftwidth
        end,
        padding = 1,
    },
    progress = {
        "progress",
        fmt = function()
            return "%P/%L"
        end,
        color = {},
    },
}

lualine.setup {
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "auto",
        component_separators = "|",
        section_separators = "",
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = {
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1 },
        },
        lualine_x = { "diagnostics", components.lsp, components.spaces },
        lualine_y = { "location" },
        lualine_z = { components.progress },
    },
    winbar = {
        lualine_a = { },
        lualine_b = { },
        lualine_c = {
            { "filename", path = 0, separator = "" },
            {
                -- Code Breadcrumbs
                function() return require("nvim-navic").get_location({ separator = " ", depth_limit = 5 }) end,
                cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {
        lualine_a = { { "filename", path = 1 } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}

vim.opt.showmode = false -- no -- INSERT anymore
vim.opt.laststatus = 3   -- one liner in splits
