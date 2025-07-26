------------------------------------------------------------------
-- https://github.com/nvim-telescope/telescope.nvim
------------------------------------------------------------------

local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"xiyaowong/telescope-emoji.nvim",
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
}

function M.config()
	local actions = require("telescope.actions")
	require("telescope").setup({
		defaults = {
			path_display = { "smart" },
			sorting_strategy = "ascending",
			layout_config = {
                prompt_position = "top",
			},
			file_ignore_patterns = {
				".git/",
				"node_modules",
				".parcel-cache",
				".cache",
				"dist",
			},
			borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			prompt_prefix = " ",
			winblend = 0,
		},
		pickers = {
			find_files = {
				hidden = true,
			},
			live_grep = {
				--@usage don't include the filename in the search results
				only_sort_text = true,
			},
			grep_string = {
				only_sort_text = true,
			},
			buffers = {
				initial_mode = "normal",
				mappings = {
					i = { ["<c-d>"] = actions.delete_buffer + actions.move_to_top },
					n = { ["dd"] = actions.delete_buffer + actions.move_to_top },
				},
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
			emoji = {},
		},
	})

	-- Enable Telescope extensions if they are installed
	pcall(require("telescope").load_extension, "fzf")
	pcall(require("telescope").load_extension, "ui-select")
	pcall(require("telescope").load_extension, "emoji")

	------------------
	-- Mappings
	------------------

	local map = vim.keymap.set
	local builtin = require("telescope.builtin")

	map("n", "<leader>fa", builtin.autocommands, { desc = "[a]uto commands" })
	map("n", "<leader>fc", builtin.command_history, { desc = "[c]ommand history" })
	map("n", "<leader>fC", builtin.commands, { desc = "[C]ommands" })
	map("n", "<leader>fh", builtin.help_tags, { desc = "[h]elp" })
	map("n", "<leader>fH", builtin.highlights, { desc = "[H]ighlights" })
	map("n", "<leader>fk", builtin.keymaps, { desc = "[k]ey maps" })
	map("n", "<leader>fm", builtin.marks, { desc = "[m]arks" })
	map("n", "<leader>fM", builtin.man_pages, { desc = "[M]an pages" })
	map("n", "<leader>fo", builtin.vim_options, { desc = "[o]ptions" })
	map("n", "<leader>fl", builtin.resume, { desc = "[l]ast search" })
	map("n", "<leader>fw", builtin.grep_string, { desc = "[w]ord" })
	-- lists
	map("n", "<leader>xj", builtin.jumplist, { desc = "[j]ump list" })
	map("n", "<leader>xl", builtin.loclist, { desc = "[l]ocation list" })
	map("n", "<leader>xq", builtin.quickfix, { desc = "[q]uickfix list" })
	-- git
	map("n", "<leader>go", builtin.git_status, { desc = "[o]pen status" })
	map("n", "<leader>gb", builtin.git_branches, { desc = "[b]ranches checkout" })
	map("n", "<leader>gc", builtin.git_commits, { desc = "[c]ommits checkout" })
	map("n", "<leader>gC", builtin.git_bcommits, { desc = "[C]ommits (current file)" })

	-- emojis 😁
	map("n", "<leader>fe", "<cmd>Telescope emoji<cr>", { desc = "[e]mojis" })

	-- Telescope builtins
	map("n", "<C-p>", function()
		builtin.builtin(require("telescope.themes").get_dropdown({
			previewer = false,
		}))
    end, { desc = "Telescope builtins" } )

	-- search in current buffer
	map("n", "<leader>/", function()
		builtin.current_buffer_fuzzy_find(
			require("telescope.themes").get_ivy({ winblend = 10, previewer = false })
		)
	end, { desc = "find" })

	-- files
	map("n", "<leader>ff", function()
		builtin.find_files(require("telescope.themes").get_dropdown({ previewer = false }))
	end, { desc = "[f]iles" })

	map("n", "<leader>fr", function()
        builtin.oldfiles(require("telescope.themes").get_dropdown({ previewer = false }))
    end, { desc = "[r]ecent files" })

	-- live grep
	map("n", "<leader>fg", function()
		builtin.live_grep({ additional_args = { "--hidden" } })
	end, { desc = "[g]rep" })

	-- buffers
	map("n", "<leader>fb", function()
		builtin.buffers(require("telescope.themes").get_dropdown({ previewer = false }))
	end, { desc = "[b]uffers" })

	-- live grep in open files
	map("n", "<leader>f/", function()
		builtin.live_grep({
			grep_open_files = true,
			prompt_title = "live grep in open files",
		})
	end, { desc = "grep open" })

	-- Shortcut for searching your Neovim configuration files
	map("n", "<leader>f.", function()
		builtin.find_files(require("telescope.themes").get_dropdown({ cwd = "~/.dotfiles", previewer = false }))
	end, { desc = "dotfiles" })

    -- theme switcher
	map("n", "<leader>uc", function()
		-- nice hot reload
		builtin.colorscheme(require("telescope.themes").get_dropdown({ enable_preview = true, previewer = false  }))
	end, { desc = "[c]olorscheme" })
end

return M
