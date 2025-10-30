return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'echasnovski/mini.icons' },
  config = function()
    require('nvim-tree').setup({
      sort_by = 'case_sensitive',
      view = {
        side = "left",
        number = false,
        relativenumber = false,
        width = 40,
      },
      renderer = {
        group_empty = false,
        indent_markers = { enable = true },
        icons = {
          git_placement = 'after',
          symlink_arrow = "->",
          show = {
            folder = true,
          }
        },
        root_folder_label = function(path)
          return path:gsub('\\', '/')
        end,
      },
      filters = { dotfiles = false },
      hijack_cursor = true,
      hijack_directories = {
        enable = false,
        auto_open = false,
      },
      hijack_netrw = false,
    })

    vim.keymap.set('n', '<C-f>', require('nvim-tree.api').tree.toggle, { desc = 'Open filetree'})
  end,
}
