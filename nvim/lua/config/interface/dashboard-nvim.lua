local vim = vim

vim.g.dashboard_custom_header = {
    '',
    '',
    '',
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    '',
    '',
}
vim.g.dashboard_custom_shortcut= {
    last_session = 'SPC s l',
    find_history = 'SPC f h',
    find_file = 'SPC f f',
    new_file = 'SPC c n',
    change_colorscheme =  'SPC t c',
    find_word = 'SPC f a',
    book_marks = 'SPC f b',
}
vim.g.dashboard_default_executive = 'telescope'
vim.api.nvim_set_keymap('n', '<leader>ss', ':<C-u>SessionSave<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sl', ':<C-u>SessionLoad<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':<C-u>DashboardFindHistory<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':<C-u>DashboardFindFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tc', ':<C-u>DashboardChangeColorscheme<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fa', ':<C-u>DashboardFindWord<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':<C-u>DashboardJumpMark<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cn', ':<C-u>DashboardNewFile<CR>', { noremap = true, silent = true })
