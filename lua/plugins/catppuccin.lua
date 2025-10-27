return {
  'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    local utils = require("catppuccin.utils.colors")
    local colors = require("catppuccin.palettes").get_palette()
    local cursorline_bg  = utils.vary_color(
      { latte = utils.lighten(colors.mantle, 0.70, colors.base) },
      utils.darken(colors.surface0, 0.64, colors.base)
    )

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
          Visual = { style = { } },
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
          LineNr = { fg = c.surface2 },
          CursorLineNr = { fg = c.lavender },
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
          -- RainbowDelimiterRed     = { fg = blend(c.red, c.text, 0.7) },
          -- RainbowDelimiterYellow  = { fg = blend(c.yellow, c.text, 0.7) },
          -- RainbowDelimiterBlue    = { fg = blend(c.blue, c.text, 0.7) },
          -- RainbowDelimiterOrange  = { fg = blend(c.peach, c.text, 0.7) },
          -- RainbowDelimiterGreen   = { fg = blend(c.green, c.text, 0.7) },
          -- RainbowDelimiterViolet  = { fg = blend(c.mauve, c.text, 0.7) },
          -- RainbowDelimiterCyan    = { fg = blend(c.sky, c.text, 0.7) },
          MatchParen = { fg = c.none, bg = c.surface1, style = { 'bold' } },
          -- Float
          NormalFloat = { bg = c.none },
          FloatBorder = { bg = c.none },
          -- Telescope prompt
          TelescopePromptNormal = { bg = cursorline_bg },
          TelescopePromptPrefix = { fg = c.mauve },
          TelescopePromptCounter = { bg = cursorline_bg, fg = c.mauve },
          TelescopePromptTitle = { bg = c.mauve, fg = c.mantle, bold = true },
          TelescopePromptBorder = { bg = cursorline_bg, fg = cursorline_bg },
          -- Telescope results
          TelescopeResultsNormal = { bg = c.mantle },
          TelescopeResultsTitle = { bg = c.blue, fg = c.mantle, bold = true },
          TelescopeResultsBorder = { bg = c.mantle, fg = c.mantle },
          TelescopeSelection = { bg = c.surface0, fg = c.blue, bold = true },
          TelescopeSelectionCaret = { fg = c.blue },
          TelescopeMatching = { fg = c.blue },
          -- Telescope preview
          TelescopePreviewNormal = { bg = c.mantle },
          TelescopePreviewTitle = { bg = c.green, fg = c.mantle, bold = true },
          TelescopePreviewBorder = { bg = c.mantle, fg = c.green },
        }
      end,
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        rainbow_delimiters = true,
        treesitter = true,
        notify = true,
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
