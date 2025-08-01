return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      shortcut_type = 'letter',
    }
  end,
  dependencies = { 'echasnovski/mini.icons' }
}
