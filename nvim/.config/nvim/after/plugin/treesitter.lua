-- nvim-treesitter/nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "javascript" }, -- A list of parser names, or "all"
	ignore_install = { "" }, -- List of parsers to ignore installing

  highlight = {
    enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
    -- additional_vim_regex_highlighting = false,
  },
	-- indent = { enable = true, disable = { "python", "css" } },
	autopairs = {
		enable = true,
	},
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}
