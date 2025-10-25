return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'echasnovski/mini.icons',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    extensions = {
      fzf = {},
    },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_config = {
            horizontal = {
              width = { 0.95, max = 120 },
              height = { 0.9, max = 36 },
              preview_cutoff = 80,
              preview_width = 0.5,
              prompt_position = 'bottom',
            }
          },
          border = true,
          borderchars = {
            '─', '│', '─', '│', '┌', '┐', '┘', '└'
          },
          selection_caret = "→ ",
          entry_prefix = "  ",
          prompt_prefix = '> ',
        },
        pickers = {
          find_files = { follow = true },
          live_grep = {
            additional_args = function() return { '--follow' } end,
          },
        },
      })
      local builtin = require('telescope.builtin')

      -- Telescope keybinds

      vim.keymap.set('n', '<Leader>f', builtin.find_files, { desc = 'Search files' })
      vim.keymap.set('n', '<Leader>g', builtin.live_grep, { desc = 'Search grep' })
      vim.keymap.set('n', '<Leader>sb', builtin.buffers, { desc = 'Search buffers' })
      vim.keymap.set('n', '<Leader>sh', builtin.help_tags, { desc = 'Search help tags' })
      vim.keymap.set('n', '<Leader>sm', builtin.marks, { desc = 'Search marks' })
      vim.keymap.set('n', '<Leader>sk', builtin.keymaps, { desc = 'Search keymaps' })
      vim.keymap.set('n', '<Leader>sc', builtin.git_status, { desc = 'Telescope git status' })

      -- Search with "hidden" files included

      vim.keymap.set('n', '<leader>F', function()
        builtin.find_files({
          hidden = true,
          no_ignore = true,
          follow = true,
        })
      end, { desc = 'Search files (+hidden)' })

      vim.keymap.set('n', '<leader>G', function()
        builtin.live_grep({
          additional_args = function()
            return { '--hidden', '--no-ignore', '--follow' }
          end,
        })
      end, { desc = 'Search grep (+hidden)' })

    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown {}
          }
        }
      })
      require('telescope').load_extension('ui-select')
    end
  }
}
