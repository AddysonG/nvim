return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        'bash',
        'c',
        'c_sharp',
        'comment',
        'commonlisp',
        'cpp',
        'css',
        'csv',
        'diff',
        'dockerfile',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'gowork',
        'html',
        'hyprlang',
        'java',
        'javadoc',
        'javascript',
        'json',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'python',
        'sql',
        'toml',
        'vim',
        'xml',
      },
      highlight = { enable = true },
      indent = { enable = true },
    })

    vim.filetype.add({
      pattern = { ['.*/hypr/.*%.conf'] = 'hyprlang' },
    })
  end
}
