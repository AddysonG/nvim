return {
  'catppuccin/nvim',
  name = 'catppuccin',
  opts = {
    transparent_background = true,
    flavour = 'mocha',
    custom_highlights = function(c)
      local menu_bg = { bg = c.surface0 }
      -- grab the cursorline color
      local U = require('catppuccin.utils.colors')
      local cursorline_bg  = U.vary_color(
        { latte = U.lighten(c.mantle, 0.70, c.base) },
        U.darken(c.surface0, 0.64, c.base)
      )
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
        DiagnosticUnderlineHint = { style = { 'undercurl' } },
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
        -- Debug line
        DapStoppedSign = { fg = c.lavender },
        DapStoppedLine = { bg = c.surface0 },
        -- Matching parentheses
        MatchParen = { fg = c.none, style = { 'bold' } },
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
      gitsigns = {
        enabled = true,
        transparent = true,
      },
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
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme('catppuccin')
  end
}
