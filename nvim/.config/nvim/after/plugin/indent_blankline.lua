--------------------------------------------------------------------------------
-- lukas-reineke/indent-blankline.nvim
--------------------------------------------------------------------------------

local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

indent_blankline.setup {
    -- for example, context is off by default, use this to turn it on
    char = '┊',
    -- show_end_of_line = false,
    -- show_current_context = true,
    -- show_current_context_start = false,
    show_trailing_blankline_indent = false,
}

