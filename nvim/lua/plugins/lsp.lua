return {
    {
        'williamboman/mason.nvim',
        config = true,
    },
    {
        -- launches lsp servers
        "williamboman/mason-lspconfig.nvim",
        dependencies = {'williamboman/mason.nvim'},
        opts = {
            ensure_installed = {
                'gopls',
                'golangci_lint_ls',
                'lua_ls',
            },
        },
        config = true,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {'williamboman/mason-lspconfig.nvim'},
        config = function(lz, opts)
            local lspconfig = require('lspconfig')
            lspconfig.gopls.setup {
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        completeFunctionCalls = true,
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                    },
                },
            }

            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                'vim',
                            },
                        },
                        workspace = {
                            library = {
                                ['/home/matheus/tmp/work/squashfs-root/usr/share/nvim/runtime'] = true,
                                ['/home/matheus/.local/bin/nvim.appimage.home/.local/share/nvim/lazy'] = true,
                            },
                        },
                    },
                },
            }

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(ev)
                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }

                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', 'gR', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                end,
            })

            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    local params = vim.lsp.util.make_range_params()
                    params.context = {only = {"source.organizeImports"}}
                    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
                    -- machine and codebase, you may want longer. Add an additional
                    -- argument after params if you find that you have to write the file
                    -- twice for changes to be saved.
                    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
                    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
                    for cid, res in pairs(result or {}) do
                        for _, r in pairs(res.result or {}) do
                            if r.edit then
                                local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                                vim.lsp.util.apply_workspace_edit(r.edit, enc)
                            end
                        end
                    end
                    vim.lsp.buf.format({async = false})
                end
            })
        end,
    },
}
