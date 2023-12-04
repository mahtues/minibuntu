require('mason').setup {}
require('mason-lspconfig').setup {
    ensure_installed = {
        'gopls',
        'golangci_lint_ls',
        'lua_ls',
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

-- remapping kind to 1 char only
local util = require('vim.lsp.util')
local orig = util.text_document_completion_list_to_complete_items
local ffunc = function(a, b)
    local symbol_map = {
      --Text = '󰉿',
      Method = 'f',
      Function = 'f',
      Constructor = 'f',
      Field = 'm',
      Variable = 'v',
      Class = 't',
      Interface = 't',
      Module = '0',
      Property = 'm',
      --Unit = '󰑭',
      Value = 'v',
      Enum = 't',
      --Keyword = '󰌋',
      --Snippet = '',
      --Color = '󰏘',
      File = '0',
      --Reference = '󰈇',
      Folder = '0',
      EnumMember = 'm',
      Constant = 'v',
      Struct = 't',
      --Event = '',
      --Operator = '󰆕',
      --TypeParameter = ' ',
    }

    local r = orig(a, b)
    for _, v in ipairs(r) do
        v.kind = symbol_map[v.kind] or v.kind or '?'
    end
    return r
end
util.text_document_completion_list_to_complete_items = ffunc
