vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('HighlightYank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 200
    })
  end
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Use tabs as indent for specific file types',
  pattern = { 'sh' },
  group = vim.api.nvim_create_augroup('TabIndent', { clear = true }),
  callback = function()
    local listchars = vim.opt.listchars:get()
    listchars.tab = '  '
    vim.opt_local.listchars = listchars
    vim.opt_local.expandtab = false
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

-- Disable auto-inserting comments
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt.formatoptions:remove({ 'o' })
  end,
})

-- Disable visually showing tabs for when those are the preferred indent character
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    local listchars = vim.opt.listchars:get()
    listchars.tab = '  '
    vim.opt_local.listchars = listchars
    vim.opt_local.expandtab = false
  end,
})
-- Autoformat Go files
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function(args)
    vim.lsp.buf.format({
      bufnr = args.buf,
      async = false,
      filter = function(client)
        -- Only use gopls for formatting
        return client.name == 'gopls'
      end,
    })
  end,
})

-- Line wrapping for telescope previewer
vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function(args)
    if args.data and args.data.filetype == "help" then
      return
    end

    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.wo.breakindent = true
    vim.wo.showbreak = "⮡"
  end,
})
