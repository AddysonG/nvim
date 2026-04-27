return {
  'MeanderingProgrammer/render-markdown.nvim',
  opts = {
    nested = false,
    heading = {
      icons = { '', '', '', '', '', '' },
      position = 'eol',
      signs = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      backgrounds = { nil, nil, nil, nil, nil, nil },
    },
    code = {
      sign = false,
      language_name = false,
      language_info = false,
      width = 'block',
      right_pad = 2,
      border = 'thick',
    },
    bullet = {
      icons = { '•', '◦', '‣', '⁃' }
    },
    pipe_table = {
      border_enabled = false,
      alignment_indicator = '┄',
    }
  },
}
