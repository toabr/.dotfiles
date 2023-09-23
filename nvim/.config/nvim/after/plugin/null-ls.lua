--------------------------------------------------------------------------------
-- jose-elias-alvarez/null-ls.nvim
-- jay-babu/mason-null-ls.nvim
--------------------------------------------------------------------------------

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

-- local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

require("mason-null-ls").setup({
    ensure_installed = {
        -- Opt to list sources here, when available in mason.
        'prettierd',
    },
    automatic_installation = false,
    handlers = {},
})

null_ls.setup({
    sources = {
        -- anything not supported by mason
        -- diagnostics.eslint_d,
        -- formatting.prettierd,
    },
})
