return {
  'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    local blend = require('catppuccin.utils.colors').blend
    require("catppuccin").setup({
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = {}, -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {},
      custom_highlights = function(c)
        local menu_bg = { bg = c.surface0 }

        return {
          ColorColumn = { link = 'CursorLine' },
          -- Spell
          SpellBad = { sp = c.blue, style = { 'undercurl' } },
          SpellCap = { style = { } },
          SpellLocal = { style = { } },
          SpellRare = { style = { } },
          -- Diagnostic underlines
          DiagnosticUnderlineError = { style = { 'undercurl' } },
          DiagnosticUnderlineWarn = { style = { 'undercurl' } },
          DiagnosticUnderlineInfo = { style = { 'undercurl' } },
          DiagnosticUndrelineHint = { style = { 'undercurl' } },
          -- Base color
          --Normal = { fg = c.text, bg = c.base }, -- normal text
          -- "Gutter"
          LineNr = { fg = c.overlay0 },
          CursorLineNr = { fg = c.blue, style = { 'bold' } },
          -- Popup menu
          Pmenu = menu_bg,
          PmenuSel = { bg = c.surface1, style = { 'bold' } },
          LspSignatureActiveParameter = { bg = c.surface1, style = { 'bold' } },
          BlinkCmpDoc = menu_bg,
          BlinkCmpDocBoarder = menu_bg,
          BlinkCmpDocSeparator = menu_bg,
          BlinkCmpSignatureHelp = menu_bg,
          BlinkCmpSignatureHelpBorder = menu_bg,
          -- Diagnostic sign
          DiagnosticSignError = { fg = c.red },
          DiagnosticSignWarn  = { fg = c.yellow },
          DiagnosticSignInfo  = { fg = c.sky },
          DiagnosticSignHint  = { fg = c.teal },
          -- Breakpoint sign
          DapBreakpointSign          = { fg = c.red },
          DapBreakpointConditionSign = { fg = c.yellow },
          DapBreakpointRejectedSign  = { fg = c.red },
          -- Rainbow delimiters
          RainbowDelimiterRed     = { fg = blend(c.red, c.text, 0.5) },
          RainbowDelimiterYellow  = { fg = blend(c.yellow, c.text, 0.5) },
          RainbowDelimiterBlue    = { fg = blend(c.blue, c.text, 0.5) },
          RainbowDelimiterOrange  = { fg = blend(c.peach, c.text, 0.5) },
          RainbowDelimiterGreen   = { fg = blend(c.green, c.text, 0.5) },
          RainbowDelimiterViolet  = { fg = blend(c.mauve, c.text, 0.5) },
          RainbowDelimiterCyan    = { fg = blend(c.sky, c.text, 0.5) },
        }
      end,
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        rainbow_delimiters = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
            ok = { 'italic' },
          },
          indent_blankline = {
            enabled = true,
            scope_color = '',
            colored_indent_levels = false,
          },
          inlay_hints = { background = true },
        },
      },
    })
    vim.cmd.colorscheme 'catppuccin'
  end
}
