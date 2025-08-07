vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('HighlightYank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = 'Visual',
      timeout = 200
    })
  end
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
  end
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Set wrap for certain file types',
  pattern = { 'markdown' },
  group = vim.api.nvim_create_augroup('MarkdownWrap', { clear = true }),
  callback = function()
    vim.wo.wrap = true
  end
})

--vim.api.nvim_create_autocmd("VimLeave", {
--  desc = "Restore cursor shape and blinking on exit",
--  group = vim.api.nvim_create_augroup('CursorReset', { clear = true }),
--  command = "set guicursor=a:block-blinkon1-blinkoff1",
--})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.lua',
  callback = function(args)
    local path = vim.fn.fnamemodify(args.file, ':p')
    if path:find('/.config/nvim/') then
      local bo = vim.bo[args.buf]
      bo.tabstop = 2
      bo.softtabstop = 2
      bo.shiftwidth = 2
    end
  end,
  desc = 'Set 2-space indent for Neovim config files',
})

-- Only highlight cursor row and color column for active window

vim.api.nvim_create_autocmd('WinEnter', {
  callback = function()
    vim.wo.cursorline = true
  end,
})

vim.api.nvim_create_autocmd('WinLeave', {
  callback = function()
    vim.wo.cursorline = false
  end,
})


