local defaults = {
    sorting_strategy = 'ascending',
    layout_config = {
        horizontal = {
            prompt_position = 'top',
            results_width = 0.4,
            preview_width = 0.6,
        },
        width = 0.87,
        height = 0.80,
    },
    border = {},
    borderchars = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}
}

require('telescope').setup {
    defaults = defaults,
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]ile'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[f]ind by [g]rep'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[f]ind [h]elp'})
