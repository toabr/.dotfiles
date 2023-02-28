--------------------------------------------------------------------------------
-- nvim-treesitter/nvim-treesitter
--------------------------------------------------------------------------------

local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

local configs = require "nvim-treesitter.configs"

configs.setup {
  ensure_installed = {
    "bash",
    "help",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "regex",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  sync_install = false,
  auto_install = true,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<cr>",
      node_incremental = "<cr>",
      scope_incremental = "<nop>",
      node_decremental = "<bs>",
    },
  },
  -- JoosepAlviste/nvim-ts-context-commentstring
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

