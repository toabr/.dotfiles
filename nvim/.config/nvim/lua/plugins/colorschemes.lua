function setTheme(theme)
    theme = theme or "default"
    vim.opt.termguicolors = true
    vim.opt.background = "dark"

    vim.cmd.colorscheme(theme)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	"catppuccin/nvim",
	"ellisonleao/gruvbox.nvim",
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			vim.g.zenbones_darken_comments = 45
            setTheme()
		end,
	},
	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_transparent_background = 2
			vim.g.everforest_dim_inactive_windows = 0
			vim.g.everforest_ui_contrast = "low"
			vim.g.everforest_diagnostic_text_highlight = 0
			vim.g.everforest_diagnostic_line_highlight = 0
			vim.g.everforest_diagnostic_virtual_text = "grey"
			vim.g.everforest_current_word = "underline"
		end,
	},
	{
		"folke/tokyonight.nvim",
		opts = {
			style = "night",
			light_style = "day",
			transparent = false,
		},
	},
}
