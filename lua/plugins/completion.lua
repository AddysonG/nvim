return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    -- All presets have the following mappings:
    --   C-space: Open menu or open docs if already open
    --   C-n/C-p or Up/Down: Select next/previous item
    --   C-e: Hide menu
    --   C-k: Toggle signature help (if signature.enabled = true)
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      trigger = {
        show_on_keyword = false,
        show_on_insert = false,
        show_on_trigger_character = false,
        show_on_accept_on_trigger_character = false,
        show_on_insert_on_trigger_character = false,
      },
      menu = {
        auto_show = false,
        border = 'none',
      },
      documentation = {
        auto_show = true,
        window = { border = 'none' }
      },
      list = {
        selection = {
          -- When true, automatically select the first item in completion list
          preselect = true,
          -- When true, insert the completion item automatically when selecting
          auto_insert = false,
        },
        --ghost_text = { enabled = false }
      },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      -- default = { 'lsp', 'path', 'snippets', 'buffer' },
      -- Removing buffer excludes previously typed words from completion
      default = { 'lsp', 'path', 'snippets' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature = {
      enabled = true,
      trigger = {
        show_on_keyword = false,
        show_on_insert = false,
        show_on_trigger_character = false,
        show_on_accept_on_trigger_character = false,
        show_on_insert_on_trigger_character = false,
      },
    },
  },
}
