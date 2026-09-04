return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'seblyng/roslyn.nvim',
    },
    config = function()
      -- Diagnostics
      vim.opt.winborder = 'rounded'

      -- C/C++
      vim.lsp.enable('clangd')

      -- C#
      vim.lsp.config('roslyn', {
        on_attach = function(client, _)
          -- workaround to ignore missing progress message value
          local orig = client.handlers['$/progress']
            or vim.lsp.handlers['$/progress']
          client.handlers['$/progress'] = function(err, result, ctx, cfg)
            if result == nil or result.value == nil then return end
            if orig then return orig(err, result, ctx, cfg) end
          end
        end,
      })
      vim.lsp.enable('roslyn')

      -- CSS
      vim.lsp.enable('cssls')

      -- Elixir
      vim.lsp.config('expert', {
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          local matches = vim.fs.find(
            { 'mix.exs' },
            { upward = true, limit = 2, path = fname }
          )
          local child_or_root_path, maybe_umbrella_path = unpack(matches)
          local root_dir =
            vim.fs.dirname(maybe_umbrella_path or child_or_root_path)
          if root_dir then on_dir(root_dir) end
        end,
      })
      vim.lsp.enable('expert')

      -- Go
      vim.lsp.enable('gopls')

      -- HTML
      vim.lsp.enable('html')

      -- Java
      vim.lsp.config('jdtls', {
        root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml' },
      })
      vim.lsp.enable('jdtls')

      -- JavaScript/TypeScript
      vim.lsp.config('ts_ls', {
        settings = {
          implicitProjectConfiguration = {
            checkJs = true,
          },
        },
      })
      vim.lsp.enable('ts_ls')

      -- JSON
      vim.lsp.enable('jsonls')

      -- Lua
      vim.lsp.enable('lua_ls')

      -- Python
      vim.lsp.enable('ruff')
      vim.lsp.enable('ty')

      -- QML
      vim.lsp.config('qmlls', {
        cmd = { 'qmlls6' },
        on_init = function(client)
          -- Workaround for a bug that causes lots of annoying error popups
          client.server_capabilities.semanticTokensProvider.full.delta = false
        end,
      })
      vim.lsp.enable('qmlls')

      -- Disable Ruff hover since most dedicated LSPs support it
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup(
          'lsp_attach_disable_ruff_hover',
          { clear = true }
        ),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client == nil then return end
          if client.name == 'ruff' then
            client.server_capabilities.hoverProvider = false
          end
        end,
        desc = 'LSP: Disable hover capability from Ruff',
      })
    end,
  },
  {
    'seblyng/roslyn.nvim',
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {},
  },
  {
    'mfussenegger/nvim-jdtls',
    dependencies = { 'mfussenegger/nvim-dap' },
  },
  {
    'lopi-py/luau-lsp.nvim',
    ft = 'luau',
    enabled = function() return vim.fn.executable('luau-lsp') == 1 end,
    ---@module 'luau-lsp.config'
    ---@type luau-lsp.Config
    opts = {
      plugin = { enabled = true },
      sourcemap = { autogenerate = false },
    },
  },
}
