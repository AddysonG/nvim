return {
  'folke/which-key.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  event = 'VeryLazy',
  opts = {
    triggers = {}
  },
  keys = {
    {
      '<leader>w',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Which Key'
    }
  }
}
