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
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {},
        lualine_x = { components.lsp, components.spaces, "filetype" },
        lualine_y = { "location" },
        lualine_z = { components.progress },
    },
    winbar = {
        lualine_a = { { "filename", path = 1 } },
        lualine_b = {},
        lualine_c = { "%=" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {
        lualine_a = { { "filename" , path = 1 } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}

vim.opt.showmode = false -- no -- INSERT anymore
vim.opt.laststatus = 3 -- one liner in splits

