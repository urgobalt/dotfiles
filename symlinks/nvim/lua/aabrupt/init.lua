vim.g.mapleader = " "
require("aabrupt.lazy")
require("aabrupt.settings")
require("aabrupt.autocmd")

vim.keymap.set('n', '<leader>w', ":w<CR>", {desc = "[W]rite Current Buffer To File"})
vim.keymap.set('n', '-', ":E<CR>")
