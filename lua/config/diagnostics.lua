vim.diagnostic.config({
  -- Prioritize displaying signs and virtual text based on priority
  -- instead of recency (error > warning > ...)
  severity_sort = true,

  -- Custom signs for diagnostics
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN]  = '',
      [vim.diagnostic.severity.INFO]  = '',
      [vim.diagnostic.severity.HINT]  = '',
    },
  },

  -- Don't show first diagnostic information at end of line
  virtual_text = false,
})
