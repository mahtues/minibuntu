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

if vim.fn.has('nvim-0.9.4') then
    local util = require('vim.lsp.util')
    local orig = util.text_document_completion_list_to_complete_items
    local ffunc = function(a, b)
        local r = orig(a, b)
        for _, v in ipairs(r) do
            v.kind = symbol_map[v.kind] or v.kind or '?'
        end
        return r
    end
    util.text_document_completion_list_to_complete_items = ffunc
end

if vim.fn.has('nvim-0.10') then
    -- neovim 0.10.0
    local util = require('vim.lsp._completion')
    local orig = util._lsp_to_complete_items
    local ffunc = function(a, b)
        local r = orig(a, b)
        for _, v in ipairs(r) do
            v.kind = symbol_map[v.kind] or v.kind or '?'
        end
        return r
    end
    util._lsp_to_complete_items = ffunc
end

return {}
