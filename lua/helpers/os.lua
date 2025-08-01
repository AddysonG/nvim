local M = {}

M.get_os = function()
  return vim.fn.has('mac') == 1 and 'mac'
  or vim.fn.has('win32') == 1 and 'win'
  or 'linux'
end

return M
