return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      enable_bracket_in_quote = false,
    },
  },
  {
    'windwp/nvim-ts-autotag',
    opts = {
      {
        enable_close = true,
        enable_rename = false,
        enable_close_on_slash = false,
      }
    }
  }
}
