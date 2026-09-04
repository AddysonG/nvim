--[[
Ruff offers 
- "ruff_fix": auto-fixes fixable lint violations
- "ruff_format": base formatter, keep on
- "ruff_organize_imports": groups and sorts import statements
--]]

local function qmlformat_command()
  local version = vim.fn.system({ 'qmlformat', '--version' })

  if vim.v.shell_error == 0 and version:match('qmlformat%s+6%.') then
    return 'qmlformat'
  end

  local qt_bin = vim.trim(vim.fn.system({ 'qmake6', '-query', 'QT_HOST_BINS' }))

  if vim.v.shell_error == 0 and qt_bin ~= '' then
    return vim.fs.joinpath(qt_bin, 'qmlformat')
  end

  return 'qmlformat6'
end

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
      qml = { 'qmlformat' },
      typescript = { 'prettier' },
    },
    formatters = {
      qmlformat = {
        command = qmlformat_command,
        args = { '--inplace', '$FILENAME' },
        stdin = false,
      },
    },
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = 'fallback',
    },
    notify_no_formatters = false,
  },
}
