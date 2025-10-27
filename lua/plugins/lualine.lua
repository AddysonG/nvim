-- Separators
-- L:   
-- R:   

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'stevearc/oil.nvim',
    'catppuccin/nvim',
  },
  config = function()
    local colors = require("catppuccin.palettes").get_palette()
    local custom_theme = require("lualine.themes.catppuccin")
    custom_theme.normal.c.bg = colors.mantle

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = custom_theme,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {
        lualine_a = {
          { 'mode', color = { gui = 'bold' } }
        },
        lualine_b = {
          {
            'filename',
            file_status = true,
            newfile_status = true,
            symbols = {
              modified = '+',
              readonly = '[r]',
            }
          }
        },
        lualine_c = { 'branch', 'diff' },
        lualine_x = { 'diagnostics', 'lsp_status' },
        lualine_y = { 'filetype' },
        lualine_z = { 'location', 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
