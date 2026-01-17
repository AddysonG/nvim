local M = {}

function M.roslyn_server_path()
  local _os = require('utils/os').get_os()
  if _os == 'win' then
    return vim.fn.expand('~/AppData/Local/roslyn/Microsoft.CodeAnalysis.LanguageServer.dll')
  else
    return vim.fn.expand('~/.local/share/roslyn/Microsoft.CodeAnalysis.LanguageServer.dll')
  end
end

return M
