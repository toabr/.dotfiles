-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
-- file browser extension
-- vim.keymap.set('n', '<space>fb', '<cmd>Telescope file_browser<cr>', { noremap = true })

vim.keymap.set('n', '<C-p>', builtin.builtin, {})
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, {})

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  pickers = {
   -- builtin = {
   --   theme = 'dropdown',
   --   previewer = false,
   -- },
    current_buffer_fuzzy_find = {
      theme = 'dropdown',
      previewer = false,
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    file_browser = {
      theme = "ivy",
      hidden = true,
      -- disables netrw and use telescope-file-browser in its place
      -- hijack_netrw = true,
    },
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
-- require('telescope').load_extension('media_files')
require('telescope').load_extension('ui-select')
require('telescope').load_extension('projects')
