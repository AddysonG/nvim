return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    win_options = {
      wrap = false,
      spell = false,
    },
    view_options = {
      show_hidden = true,
      show_parent_dir = false,
      is_always_hidden = function(name, _)
        return name == '..'
      end,
    },
    keymaps = {
      ['<C-h>'] = false,
      ['<C-l>'] = false,
    },
  },
  -- Optional dependencies
  dependencies = { 'echasnovski/mini.icons', opts = {} },
  keys = {
    { '-', function() require('oil').open() end, desc = 'Oil open parent dir' },
    { '<Leader>or', function() require('oil').refresh() end, desc = 'Refresh oil' },
  },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
