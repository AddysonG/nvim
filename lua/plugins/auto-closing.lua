return {
  {
    -- Braces
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    -- HTML tags
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,
          enable_rename = false, -- Doesn't seem to work?
          enable_close_on_slash = false,
        }
      })
    end
  },
}
