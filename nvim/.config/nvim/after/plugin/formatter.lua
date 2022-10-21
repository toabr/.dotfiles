-- mhartington/formatter.nvim
-- vim.keymap.set('n', '<leader>F', ':Format<CR>')

require('formatter').setup {
  logging = false,
  filetype = {
    javascript = {
      -- @fsouza/prettierd
      require("formatter.filetypes.javascript").prettierd,
      function()
        return {
          exe = "prettierd",
          args = {
            -- https://prettier.io/docs/en/options.html#tab-width
            '--tab-width=2',
            '--no-semi',
            vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

-- Format after save
-- vim.api.nvim_exec([[
--     augroup FormatAutogroup
--       autocmd!
--       autocmd BufWritePost * FormatWrite
--     augroup END
-- ]], false)
