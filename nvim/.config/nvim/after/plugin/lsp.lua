--------------------------------------------------------------------------------
-- neovim/nvim-lspconfig
-- williamboman/mason.nvim
-- williamboman/mason-lspconfig.nvim
--------------------------------------------------------------------------------

-- Diagnostic keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>li', "<cmd>LspInfo<cr>", { desc = '[i]nfo' })
vim.keymap.set('n', '<leader>lm', "<cmd>Mason<cr>", { desc = "[m]ason" })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local builtin = require('telescope.builtin')

    -- See `:help vim.lsp.*` for documentation
    nmap('gD', vim.lsp.buf.declaration, 'goto [d]eclaration')
    nmap('gd', builtin.lsp_definitions, 'goto [d]efinition')
    nmap('gI', builtin.lsp_implementations, 'goto [I]mplementation')
    nmap('gr', builtin.lsp_references, 'goto [r]eferences')
    nmap('gt', builtin.lsp_type_definitions, 'goto [t]ype definition')
    nmap('gk', vim.lsp.buf.signature_help, 'Signature Documentation')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<leader>la', vim.lsp.buf.code_action, '[a]ction')
    nmap('<leader>lr', vim.lsp.buf.rename, '[r]ename')
    nmap('<leader>lF', vim.lsp.buf.format, '[F]oramt')
    nmap('<leader>ld', builtin.lsp_dynamic_workspace_symbols, '[d]ynamic Symbols')

    nmap('<leader>sd', builtin.diagnostics, '[d]iagnostics')
    nmap('<leader>ss', builtin.lsp_document_symbols, '[s]ymbols (document)')
    nmap('<leader>sS', builtin.lsp_workspace_symbols, '[S]ymbols (workspace)')


    -- See `:help K` for why this keymap

    -- Lesser used LSP functionality
    nmap('<leader>lfa', vim.lsp.buf.add_workspace_folder, '[A]dd Folder')
    nmap('<leader>lfr', vim.lsp.buf.remove_workspace_folder, '[R]emove Folder')
    nmap('<leader>lfl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

----------------------------------------------------------------
-- williamboman/mason.nvim
-- williamboman/mason-lspconfig.nvim
----------------------------------------------------------------

-- Enable the following language servers
local servers = {
    html = {},
    tsserver = {},
    lua_ls = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

-- Setup mason so it can manage external tooling
require("mason").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities
mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}
