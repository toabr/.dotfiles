--------------------------------------------------------------------------------
-- lewis6991/gitsigns.nvim
--------------------------------------------------------------------------------

local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    return
end

gitsigns.setup {
    signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        -- Actions
        map('n', '<leader>gS', gs.stage_buffer, { desc = "[S]tage buffer"})
        map('n', '<leader>gR', gs.reset_buffer, { desc = "[R]eset buffer"})
        map('n', '<leader>gd', gs.diffthis, { desc = "[d]iffthis"})
        map('n', '<leader>gD', function() gs.diffthis('~') end, { desc = "[D]iffthis ~"})
        map('n', '<leader>gt', gs.toggle_deleted, { desc = "[t]oggle deleted"})
        map('n', '<leader>gl', function() gs.blame_line { full = true } end, { desc = "[l]ine blame"})
        -- map('n', '<leader>gB', gs.toggle_current_line_blame)

        -- hunks
        map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>', { desc = "[s]tage"})
        map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>', { desc = "[r]eset"})
        map('n', '<leader>ghp', gs.preview_hunk, { desc = "[p]review"})
        map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = "[u]ndo stage"})

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
