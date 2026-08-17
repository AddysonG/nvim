return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    vim.filetype.add({
      pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang' },
    })
    require('nvim-treesitter').install({
      'bash',
      'c',
      'comment',
      'commonlisp',
      'cpp',
      'c_sharp',
      'css',
      'csv',
      'diff',
      'dockerfile',
      'elixir',
      'gitignore',
      'go',
      'gomod',
      'gosum',
      'gowork',
      'heex',
      'html',
      'hyprlang',
      'java',
      'javadoc',
      'javascript',
      'json',
      'latex',
      'lua',
      'luadoc',
      'luau',
      'markdown',
      'markdown_inline',
      'python',
      'qmljs',
      'sql',
      'toml',
      'vim',
      'xml',
      'yaml',
    })
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('TSHighlight', { clear = true }),
      callback = function() pcall(vim.treesitter.start) end,
    })
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('TSIndent', { clear = true }),
      pattern = { 'elixir', 'heex', 'lua' },
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
