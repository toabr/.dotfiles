--------------------------------------------------------------------------------
-- nvim-telescope/telescope.nvim
--------------------------------------------------------------------------------

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"
local get_icon = require("toabr.util").get_icon

telescope.setup {
    defaults = {
        layout_strategy = 'vertical',
        sorting_strategy = 'ascending',
        layout_config = {
            vertical = {
                height = 0.666,
                width = 0.8125,
                -- mirror = true,
                prompt_position = 'top',
                preview_height = 0.66,
            },
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt_prefix = get_icon("Selected", 1),
        selection_caret = get_icon("FatArrow", 1),
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
                ["<Down>"] = actions.cycle_history_next,
                ["<Up>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
                },
                n = {
                    ["dd"] = actions.delete_buffer + actions.move_to_top,
                }
            }
        },
        colorscheme = {
            enable_preview = true,
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
    }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-------------------------------------------------------------------------
-- mappings
-------------------------------------------------------------------------

-- Shorten function name
local map = vim.keymap.set
local builtin = require('telescope.builtin')

-- Telescope
map('n', '<C-p>', "<cmd>Telescope builtin<cr>")

-- lists
map("n", "<leader>xj", builtin.jumplist, { desc = "[j]ump list" })
map("n", "<leader>xl", builtin.loclist, { desc = "[l]ocation list" })
map("n", "<leader>xq", builtin.quickfix, { desc = "[q]uickfix list" })

-- git
map('n', '<leader>go', builtin.git_status, { desc = '[o]pen status' })
map('n', '<leader>gb', builtin.git_branches, { desc = '[b]ranches checkout' })
map('n', '<leader>gc', builtin.git_commits, { desc = '[c]ommits checkout' })
map('n', '<leader>gC', builtin.git_bcommits, { desc = '[C]ommits (current file)' })

-- live grep
map('n', '<leader>/', function()
    builtin.live_grep({ additional_args = { '--hidden' } })
end, { desc = 'live grep' })

-- TODO: search word under cursor

-- current buffer
map('n', '<C-f>', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false, }))
end, { desc = "[F]ind in current buffer" })

-- Find --

-- files
map('n', '<leader>ff', function()
    builtin.find_files(require('telescope.themes').get_dropdown({
        hidden = true,
        previewer = false,
    }))
end, { desc = '[f]iles' })

-- buffers
map("n", "<leader>fb", function()
    builtin.buffers(require('telescope.themes').get_dropdown({ previewer = false, }))
end, { desc = "[b]uffers" })

-- recent files ...
map("n", "<leader>fr", builtin.oldfiles, { desc = "[r]ecent" })
map('n', '<leader>fa', builtin.autocommands, { desc = '[a]uto commands' })
map('n', '<leader>fc', builtin.command_history, { desc = '[c]ommand history' })
map('n', '<leader>fC', builtin.commands, { desc = '[C]ommands' })
map('n', '<leader>fh', builtin.help_tags, { desc = '[h]elp' })
map('n', '<leader>fH', builtin.highlights, { desc = '[H]ighlights' })
map('n', '<leader>fk', builtin.keymaps, { desc = '[k]ey maps' })
map('n', '<leader>fm', builtin.marks, { desc = '[m]arks' })
map('n', '<leader>fM', builtin.man_pages, { desc = '[M]an pages' })
map('n', '<leader>fo', builtin.vim_options, { desc = '[o]ptions' })
map('n', '<leader>fR', builtin.resume, { desc = '[R]esume' })
map('n', '<leader>fw', builtin.grep_string, { desc = '[w]ord' })
map('n', '<leader>uC', builtin.colorscheme, { desc = '[C]olorscheme' })
