return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'echasnovski/mini.icons' },
  keys = {
    { '<Leader>t', function() require('nvim-tree.api').tree.toggle() end,
      desc = 'File tree (nvim-tree)' },
  },
  config = function()
    require('nvim-tree').setup({
      sort_by = 'case_sensitive',
      view = {
        number = true,
        relativenumber = true,
        float = {
          enable = true,
          open_win_config = function()
            local screen_width = vim.o.columns
            local screen_height = vim.o.lines - vim.o.cmdheight - 1

            local float_width = math.min(80, math.floor(screen_width * 0.85))
            local float_height = math.floor(screen_height * 0.85 - 1)

            float_width = float_width + ((float_width + screen_width) % 2)

            return {
              border = 'rounded',
              relative = 'editor',
              width = float_width,
              height = float_height,
              row = math.floor((screen_height - float_height) * 0.5),
              col = math.floor((screen_width - float_width) * 0.5),
            }
          end
        },
      },
      renderer = {
        group_empty = true,
        icons = {
          git_placement = 'after',
        }
      },
      filters = { dotfiles = false },
    })
  end,
}
