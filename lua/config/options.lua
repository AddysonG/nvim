vim.opt.timeout = false

vim.opt.termguicolors = true

vim.opt.fixendofline = false    -- Disable automatically adding newline to end of file

vim.opt.number = true           -- Line numbering
vim.opt.relativenumber = true

vim.opt.undofile = true         -- Save undo history

vim.opt.ignorecase = true       -- Smart case searching
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'      -- Sign column

vim.opt.cursorline = true       -- Highlight current line

vim.opt.scrolloff = 8           -- Scrolloff
vim.opt.wrap = false            -- Turn off line wrapping

vim.opt.tabstop = 4             -- Visual size of tabs
vim.opt.softtabstop = 4         -- Tab size using tab key
vim.opt.shiftwidth = 4          -- Tab size using vim motions
vim.opt.expandtab = true

vim.opt.colorcolumn = '80'      -- Color column

-- Spell
vim.opt.spell = true
vim.opt.spelllang = { 'en_us', 'cjk' }
vim.opt.spelloptions = 'camel'

-- Disable tab line at top of screen in Windows
vim.opt.showtabline = 0

vim.opt.fillchars:append('eob: ')
