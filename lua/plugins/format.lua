return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      elixir = { 'mix', lsp_format = 'prefer' },
      go = { 'gofmt' },
      lua = { 'stylua' },
      python = { 'black' },
    },
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = 'fallback',
    },
    notify_no_formatters = false,
  },
}
