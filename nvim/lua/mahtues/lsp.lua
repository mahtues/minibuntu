require('mason').setup {}
require('mason-lspconfig').setup {
    ensure_installed = {
        'gopls',
        'golangci_lint_ls',
        'lua_ls',
        -- 'delve',
    },
}

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

lspconfig.golangci_lint_ls.setup {}

local lsp = require('vim.lsp')
local buf = require('vim.lsp.buf')
local util = require('vim.lsp.util')
local diagnostic = require('vim.diagnostic')

local orig = util.text_document_completion_list_to_complete_items

util.text_document_completion_list_to_complete_items = function(a, b)
    local r = orig(a, b)
    for _, v in ipairs(r) do
        v.kind = v.kind:lower():sub(1, 1)
    end
    return r
end

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
                },
            },
        },
    },
}

--@param foo integer
--@param bar string
local function func(foo, bar)
    return foo .. ' ' .. bar
end
