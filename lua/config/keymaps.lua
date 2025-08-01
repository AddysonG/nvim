-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<Leader>h', '<cmd>nohlsearch<CR>', { desc = 'Hide (dehighlight) search' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Dehighlight search' })

-- Center cursor on screen when using ctrl+u and ctrl+d
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Using leader to delete without loosing register
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Put and keep register' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete and keep register  "_d' })
vim.keymap.set('n', '<leader>D', '"_D', { desc = 'Delete and keep register  "_D' })

-- Using leader to change without loosing register
vim.keymap.set({ 'n', 'v' }, '<leader>c', '"_c', { desc = 'Change and keep register  "_c' }) vim.keymap.set('n', '<leader>C', '"_C', { desc = 'Change and keep register  "_C' })
vim.keymap.set({ 'n', 'v' }, '<leader>C', '"_C', { desc = 'Change and keep register  "_c' }) vim.keymap.set('n', '<leader>C', '"_C', { desc = 'Change and keep register  "_C' })

-- Using leader to yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard  "+y' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank line to clipboard  "+Y' })

-- Using leader to paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Put from clipboard (after)  "+p' })
vim.keymap.set('n', '<leader>P', '"+P', { desc = 'Put from clipboard (before)  "+P' })

-- Disable `Q`
vim.keymap.set('n', 'Q', '<nop>')

-- Reset horizontal scroll
vim.keymap.set('n', '<leader>_', '999zH', { desc = 'Reset horizontal scroll'})

-- Setting indentation for current buffer
vim.keymap.set('n', '<leader>ic', function()
  vim.bo.tabstop = 2
  vim.bo.softtabstop = 2
  vim.bo.shiftwidth = 2
end, { desc = 'Indent compact (2 chars)' })

vim.keymap.set('n', '<leader>ir', function()
  vim.bo.tabstop = 4
  vim.bo.softtabstop = 4
  vim.bo.shiftwidth = 4
end, { desc = 'Indent reset (4 chars)' })

vim.keymap.set('n', '<leader>iw', function()
  vim.bo.tabstop = 8
  vim.bo.softtabstop = 8
  vim.bo.shiftwidth = 8
end, { desc = 'Indent wide (8 chars)' })
