return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'seblyng/roslyn.nvim'
    },
    config = function()
      -- Diagnostics
      vim.opt.winborder = 'single'

      -- C/C++
      vim.lsp.enable('clangd')

      -- C#
      vim.lsp.config('roslyn', {
        on_attach = function(client, _)
          -- workaround to ignore missing progress message value
          local orig = client.handlers["$/progress"] or vim.lsp.handlers["$/progress"]
          client.handlers["$/progress"] = function(err, result, ctx, cfg)
            if result == nil or result.value == nil then return end
            if orig then return orig(err, result, ctx, cfg) end
          end
        end
      })
      vim.lsp.enable('roslyn')

      -- CSS
      vim.lsp.enable('cssls')

      -- Elixir
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
      vim.lsp.enable('ts_ls')

      -- Lua
      vim.lsp.enable('lua_ls')

      -- Python
      vim.lsp.config('pyright', {
        settings = {
          python = {
            pythonPath = require('utils.python').get_python_path()
          }
        },
        before_init = function(_, config)
          if require('utils.python').has_pydantic() then
            config.settings.python = vim.tbl_deep_extend("force", config.settings.python or {}, {
              analysis = {
                diagnosticSeverityOverrides = {
                  reportAttributeAccessIssue = "none",
                  reportIncompatibleVariableOverride = "none",
                },
              },
            })
          end
        end
      })
      vim.lsp.enable('pyright')
    end
  },
  {
    'seblyng/roslyn.nvim',
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {}
  },
  {
    'mfussenegger/nvim-jdtls',
    dependencies = { 'mfussenegger/nvim-dap' },
  }
}
