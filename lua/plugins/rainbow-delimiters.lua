return {
  'hiphish/rainbow-delimiters.nvim',
  main = 'rainbow-delimiters.setup',
  opts = {
    query = {
      [''] = 'rainbow-delimiters',
      lua = 'rainbow-blocks',
      luau = 'rainbow-blocks',
    },
    condition = function(bufnr) return vim.bo[bufnr].buftype == '' end,
  },
}
