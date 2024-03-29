vim.g.mapleader = ' '
require 'aabrupt.settings'
require 'aabrupt.autocmd'

vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = '[W]rite Current Buffer To File' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = '[Q]uit Current Buffer' })
vim.keymap.set('n', '<leader>Q', ':q<CR>', { desc = '[Q]uit All Open Buffers' })
vim.keymap.set('n', '<C-q>', ':q!<CR>', { desc = 'Force [Q]uit Current Buffer' })

vim.cmd.vmap('K', '<Nop>')

require 'aabrupt.lazy'
