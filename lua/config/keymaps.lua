-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Dehighlight search' })

-- Center cursor on screen when using ctrl+u and ctrl+d
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Using leader to delete without loosing register
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Put and keep register' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete and keep register  "_d' })
vim.keymap.set('n', '<leader>D', '"_D', { desc = 'Delete and keep register  "_D' })

-- Using leader to change without loosing register
vim.keymap.set({ 'n', 'v' }, '<leader>c', '"_c', { desc = 'Change and keep register  "_c' })
vim.keymap.set({ 'n', 'v' }, '<leader>C', '"_C', { desc = 'Change and keep register  "_c' })

-- Using leader to yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard  "+y' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank line to clipboard  "+Y' })

-- Using leader to paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Put from clipboard (after)  "+p' })
vim.keymap.set('n', '<leader>P', '"+P', { desc = 'Put from clipboard (before)  "+P' })

-- Disable `Q`
vim.keymap.set('n', 'Q', '<nop>')

-- Reset horizontal scroll
vim.keymap.set('n', '<leader>0', '999zH', { desc = 'Reset horizontal scroll'})

-- Setting indentation for current buffer
vim.keymap.set('n', '<leader>i2', function()
  vim.bo.tabstop = 2
  vim.bo.softtabstop = 2
  vim.bo.shiftwidth = 2
end, { desc = 'Switch indent to 2 characters' })

vim.keymap.set('n', '<leader>i4', function()
  vim.bo.tabstop = 4
  vim.bo.softtabstop = 4
  vim.bo.shiftwidth = 4
end, { desc = 'Switch indent to 4 characters' })

vim.keymap.set('n', '<leader>i8', function()
  vim.bo.tabstop = 8
  vim.bo.softtabstop = 8
  vim.bo.shiftwidth = 8
end, { desc = 'Switch indent to 8 characters' })
