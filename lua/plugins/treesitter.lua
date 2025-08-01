return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        'bash',
        'c',
        'comment',
        'cpp',
        'css',
        'csv',
        'diff',
        'dockerfile',
        'gitignore',
        'html',
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
  end
}
