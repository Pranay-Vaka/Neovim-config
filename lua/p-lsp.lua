-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

    -- format on save
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end
    })
end


local lsp_config = {
    capabilities = capabilities,
    on_attach = function(_, bufnr)
        on_attach(_, bufnr)
    end
}


require('mason-lspconfig').setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup(lsp_config)
    end,
    --[[
    sumneko_lua = function()
        require('lspconfig').sumneko_lua.setup(vim.tbl_extend('force', lsp_config, {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        }))
    end
    --]]
})

require 'lspconfig'.pyright.setup {}
require 'lspconfig'.ccls.setup {}
require 'lspconfig'.quick_lint_js.setup {}
require 'lspconfig'.tsserver.setup {}
require 'lspconfig'.vimls.setup {}
require 'lspconfig'.yamlls.setup {}
require 'lspconfig'.jsonls.setup {}
require 'lspconfig'.bashls.setup {}
require 'lspconfig'.dockerls.setup {}
require 'lspconfig'.html.setup {}
require 'lspconfig'.cssls.setup {}
require 'lspconfig'.vuels.setup {}
require 'lspconfig'.rust_analyzer.setup {}
require 'lspconfig'.gopls.setup {}
require 'lspconfig'.jdtls.setup {}
require 'lspconfig'.terraformls.setup {}
require 'lspconfig'.graphql.setup {}
require 'lspconfig'.sqlls.setup {}
require 'lspconfig'.clojure_lsp.setup {}
require 'lspconfig'.leanls.setup {}
require 'lspconfig'.elixirls.setup {}
require 'lspconfig'.svelte.setup {}
require 'lspconfig'.dartls.setup {}
require 'lspconfig'.asm_lsp.setup {}
require 'lspconfig'.hls.setup {}
require 'lspconfig'.lua_ls.setup {}
require 'lspconfig'.matlab_ls.setup {}
require 'lspconfig'.solidity.setup {}
require 'lspconfig'.tailwindcss.setup {}
