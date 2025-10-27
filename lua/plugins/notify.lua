return {
  'rcarriga/nvim-notify',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    local notify = require('notify')

    notify.setup({
      render = 'wrapped-compact',
      stages = 'static',
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { border = 'single' })
      end
    })

    local _notify = notify
    notify = function(msg, level, opts)
      --if type(msg) == 'string'
    end
    vim.notify = notify

    local telescope = require('telescope')
    telescope.load_extension('notify')
    vim.keymap.set('n', '<Leader>sn', telescope.extensions.notify.notify, { desc = 'Search marks' })
  end
}
