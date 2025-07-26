--------------------------------------------------------------------------------
-- folke/which-key.nvim
--------------------------------------------------------------------------------

return {
	"folke/which-key.nvim",
	--dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = "VeryLazy",
	enabled = true,
	opts = {
		preset = "classic",
		delay = 200,
		triggers = {
			{ "<leader>", mode = { "n", "v" } },
			{ "g", mode = { "n", "v" } },
			{ "z", mode = { "n", "v" } },
		},
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = false,
				suggestions = 20,
			},
			presets = {
				operators = false, -- adds help for operators like d, y, ...
				motions = false, -- adds help for motions
				text_objects = false, -- help for text objects triggered after entering an operator
				windows = false, -- default bindings on <c-w>
				nav = false, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		replace = {
			["<space>"] = "_",
		},
		icons = {
			mappings = false,
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜",
			group = "",
			colors = false,
		},
		win = {
            no_overlap = false,
			height = { min = 5, max = 25 }, -- min and max height of the columns
			-- padding = { 2, 2 },
			border = "single",
			wo = { winblend = 0 },
		},
		layout = {
			--width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
		},
		spec = {
			{ "<leader><space>", group = "★ Special" },
			{ "<leader>b", group = "󰓩 buffer" },
			{ "<leader>f", group = " find" },
			{ "<leader>g", group = "󰊢 git" },
			{ "<leader>gh", group = "hunk" },
			{ "<leader>l", group = " lsp" },
			{ "<leader>s", group = "󱂬 session" },
			{ "<leader>t", group = " terminal" },
			{ "<leader>u", group = " ui" },
			{ "<leader>x", group = "󰒺 fix" },
			{ "g", group = "goto" },
		},
	},
}
