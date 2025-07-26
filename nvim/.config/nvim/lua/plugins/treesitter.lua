--------------------------------------------------------------------------------
-- nvim-treesitter/nvim-treesitter
--------------------------------------------------------------------------------

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  opts = {
    ensure_installed = {
       'bash',
       'diff',
       'html',
       'lua',
       'luadoc',
       'markdown',
       'query',
       'vim',
       'vimdoc'
    },
    sync_install = false,
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = { enable = true, },
    indent = { enable = true, disable = { 'ruby' } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<cr>",
        node_incremental = "<cr>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}
