-- Separators
-- L:   
-- R:   

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'stevearc/oil.nvim' },
  config = function()
    local filename_or_path = {
      {
        function()
          local path = vim.fn.fnamemodify(require('oil').get_current_dir(), ':~:.')
          return (path == '' and '.' or path)
        end,
        cond = function() return vim.bo.filetype == 'oil' end,
      },
      {
        'filename',
        cond = function() return vim.bo.filetype ~= 'oil' end,
      },
    }
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|'},
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
        lualine_b = filename_or_path,
        lualine_c = {'diagnostics'},
        lualine_x = {'branch', 'diff'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = filename_or_path,
        lualine_x = {'location'},
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
