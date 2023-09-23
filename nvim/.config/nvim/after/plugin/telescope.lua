--------------------------------------------------------------------------------
-- nvim-telescope/telescope.nvim
--------------------------------------------------------------------------------

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

telescope.setup {
    defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = {
            ".git/",
            "node_modules",
            ".parcel-cache",
            ".cache",
            "dist",
        },

        mappings = {
            i = {
                --["<Down>"] = actions.cycle_history_next,
                --["<Up>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
}

-- Shorten function name
local map = vim.keymap.set
local builtin = require('telescope.builtin')

-- Telescope
map('n', '<C-p>', "<cmd>Telescope builtin<cr>", opts)

-- lists
map("n", "<leader>xj", builtin.jumplist, { desc = "[j]ump list" })
map("n", "<leader>xl", builtin.loclist, { desc = "[l]ocation list" })
map("n", "<leader>xq", builtin.quickfix, { desc = "[q]uickfix list" })

-- find
map("n", "<leader>fb", function()
    builtin.buffers(require('telescope.themes').get_dropdown({ previewer = false, }))
end, { desc = "[b]uffers" })
map('n', '<leader>ff', function()
    builtin.find_files(require('telescope.themes').get_dropdown({
        hidden = true,
        previewer = false,
    }))
end, { desc = '[f]iles' })
map("n", "<leader>fr", builtin.oldfiles, { desc = "[r]ecent" })

-- git
map('n', '<leader>go', builtin.git_status, { desc = '[o]pen status' })
map('n', '<leader>gb', builtin.git_branches, { desc = '[b]ranches checkout' })
map('n', '<leader>gc', builtin.git_commits, { desc = '[c]ommits checkout' })
map('n', '<leader>gC', builtin.git_bcommits, { desc = '[C]ommits (current file)' })

-- search
map('n', '<C-f>', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false, }))
end, { desc = "[F]ind in current buffer" })
map('n', '<leader>sa', builtin.autocommands, { desc = '[a]uto commands' })
map('n', '<leader>sb', builtin.current_buffer_fuzzy_find, { desc = '[b]uffer' })
map('n', '<leader>sc', builtin.command_history, { desc = '[c]ommand history' })
map('n', '<leader>sC', builtin.commands, { desc = '[C]ommands' })
map('n', '<leader>sg', builtin.live_grep, { desc = '[g]rep' })
map('n', '<leader>sh', builtin.help_tags, { desc = '[h]elp' })
map('n', '<leader>sH', builtin.highlights, { desc = '[H]ighlights' })
map('n', '<leader>sk', builtin.keymaps, { desc = '[k]ey maps' })
map('n', '<leader>sm', builtin.marks, { desc = '[m]arks' })
map('n', '<leader>sM', builtin.man_pages, { desc = '[M]an pages' })
map('n', '<leader>so', builtin.vim_options, { desc = '[o]ptions' })
map('n', '<leader>sR', builtin.resume, { desc = '[R]esume' })
map('n', '<leader>sw', builtin.grep_string, { desc = '[w]ord' })
map('n', '<leader>uC', function()
    builtin.colorscheme({ enable_preview = true })
end, { desc = '[C]olorscheme' })

