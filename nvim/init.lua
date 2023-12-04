vim.g.mapleader = ' '

require('mahtues')

local ok, _ = pcall(vim.cmd, 'colorscheme disappointment')
if not ok then
    vim.cmd 'colorscheme default'
end

vim.opt.mouse = ''
vim.opt.guicursor = ''
vim.opt.number = true
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.completeopt = 'menu,longest,noselect,noinsert'
vim.opt.wildmode = 'longest:full,full'

vim.opt.diffopt = 'filler,iwhite,context:999999'

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'single'
    opts.max_width= opts.max_width or 80
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

