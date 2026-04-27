return {
  'MeanderingProgrammer/render-markdown.nvim',
  opts = {
    heading = {
      icons = { '', '', '', '', '', '' },
      position = 'eol',
      signs = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      backgrounds = { nil, nil, nil, nil, nil, nil },
    },
    code = {
      sign = false,
      conceal_delimiters = false,
      language_name = false,
      language_info = false,
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
