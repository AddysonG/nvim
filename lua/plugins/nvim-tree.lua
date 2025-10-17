return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'echasnovski/mini.icons' },
  config = function()
    require('nvim-tree').setup({
      sort_by = 'case_sensitive',
      view = {
        number = false,
        relativenumber = false,
        float = {
          enable = false,
        },
      },
      renderer = {
        group_empty = true,
        icons = {
          git_placement = 'after',
        },
        root_folder_label = function(path)
          return path:gsub('\\', '/')
        end,
      },
      filters = { dotfiles = false },
    })

    vim.keymap.set('n', '<C-f>', require('nvim-tree.api').tree.toggle, { desc = 'Open filetree'})
  end,
}
