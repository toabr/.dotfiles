local colorscheme = "everforest"

vim.opt.termguicolors = true
vim.opt.background = "dark"

--------------------------------------------------------------------------------
-- sainnhe/everforest
--------------------------------------------------------------------------------

vim.g.everforest_background = 'hard'
vim.g.everforest_enable_italic = 1
vim.g.everforest_transparent_background = 2
vim.g.everforest_dim_inactive_windows = 0
vim.g.everforest_ui_contrast = "low"
vim.g.everforest_diagnostic_text_highlight = 0
vim.g.everforest_diagnostic_line_highlight = 0
vim.g.everforest_diagnostic_virtual_text = "grey"
vim.g.everforest_current_word = "underline"

--------------------------------------------------------------------------------
-- folke/tokyonight.nvim
--------------------------------------------------------------------------------

local tn_status_ok, tokyonight = pcall(require, "tokyonight")
if not tn_status_ok then
	return
end

tokyonight.setup({
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

