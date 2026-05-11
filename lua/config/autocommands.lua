vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('HighlightYank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 200,
    })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Use tabs as indent for specific file types',
  pattern = { 'sh' },
  group = vim.api.nvim_create_augroup('TabIndent', { clear = true }),
  callback = function() vim.opt_local.expandtab = false end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Set reduced indent size for certain filetypes',
  pattern = { 'html' },
  group = vim.api.nvim_create_augroup('ReduceIndent', { clear = true }),
  callback = function(args)
    local bo = vim.bo[args.buf]
    bo.tabstop = 2
    bo.softtabstop = 2
    bo.shiftwidth = 2
  end,
})

-- Only highlight cursor row and color column for active window
vim.api.nvim_create_autocmd('WinEnter', {
  callback = function() vim.wo.cursorline = true end,
})
vim.api.nvim_create_autocmd('WinLeave', {
  callback = function() vim.wo.cursorline = false end,
})

-- Disable auto-inserting comments
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function() vim.opt.formatoptions:remove({ 'o' }) end,
})

-- Line wrapping for telescope previewer
vim.api.nvim_create_autocmd('User', {
  pattern = 'TelescopePreviewerLoaded',
  callback = function(args)
    if args.data and args.data.filetype == 'help' then return end

    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.wo.breakindent = true
    vim.wo.showbreak = '⤷'
  end,
})
