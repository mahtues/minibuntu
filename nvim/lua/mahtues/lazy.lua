local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        -- lsp stuff
        'neovim/nvim-lspconfig',
    },
    {
        -- downloads lsp binaries
        'williamboman/mason.nvim',
    },
    {
        -- launches lsp servers
        "williamboman/mason-lspconfig.nvim",
        dependencies = { 'neovim/nvim-lspconfig', 'williamboman/mason.nvim' },
    },
    {
        'nvim-treesitter/nvim-treesitter',
    },
    {
        'nvim-treesitter/playground'
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        'tpope/vim-fugitive'
    },
    {
        'ray-x/go.nvim',
        config = function()
            require('go').setup {}
        end,
        event = {'CmdlineEnter'},
        ft = {'go', 'gomod'},
    },
}

local opts = {}

require('lazy').setup(plugins, opts)
