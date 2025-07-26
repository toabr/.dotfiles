----------------------------------------------------------------------------------
-- utility functions
----------------------------------------------------------------------------------

local M = {}

function M.get_icon(kind, spaces)
    local icons = {
        BigBall = "",
        Buffer = "󰓩",
        FatArrow = "󰁕",
        Find = "",
        LSP = "",
        Window = "",
        SlimArrow = "➜",
        GitSign = "▎",
        GitStaged = "✓",
        GitUnstaged = "✗",
        Star = "★",
        List = "󰒺",
        Terminal = "",
        Session = "󱂬",
        Selected = "❯",
        FolderClosed = "",
        FolderEmpty = "",
        FolderOpen = "",
        Git = "󰊢",
    }

    local icon = icons[kind]
    return icon and icon .. string.rep(" ", spaces or 0) or ""
end

local diagnostics_enabled = true
function M.toggle_diagnostics()
    diagnostics_enabled = not diagnostics_enabled
    if diagnostics_enabled then
        vim.diagnostic.enable()
    else
        vim.diagnostic.disable()
    end
end

return M
