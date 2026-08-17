--[[
Ruff offers 
- "ruff_fix": auto-fixes fixable lint violations
- "ruff_format": base formatter, keep on
- "ruff_organize_imports": groups and sorts import statements
--]]

return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      elixir = { 'mix', lsp_format = 'prefer' },
      go = { 'gofmt' },
      javascript = { 'prettier' },
      lua = { 'stylua' },
      luau = { 'stylua' },
      python = { 'ruff_format', 'ruff_organize_imports' },
      typescript = { 'prettier' },
    },
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = 'fallback',
    },
    notify_no_formatters = false,
  },
}
