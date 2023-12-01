require('telescope').setup {
    defaults = {
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
    },
}

