return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      elixir = { 'mix', lsp_format = 'prefer' },
      go = { 'gofmt' },
      javascript = { 'prettier' },
      lua = { 'stylua' },
      luau = { 'stylua' },
      python = { 'black' },
      typescript = { 'prettier' },
    },
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = 'fallback',
    },
    notify_no_formatters = false,
  },
}
